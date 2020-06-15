#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <src/webpagebridge.h>


#ifndef Q_OS_WIN
#include <emscripten/emscripten.h>
#endif

#ifdef Q_OS_WIN
#define EMSCRIPTEN_KEEPALIVE
#endif

static WebPageBridge webPageBridge;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("bridge", &webPageBridge);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

extern "C" {
    void EMSCRIPTEN_KEEPALIVE updateComponentSource(char* source) {
        webPageBridge.updateComponentSource(QString::fromUtf8(source));
    }
}
