#ifndef WEBPAGEBRIDGE_H
#define WEBPAGEBRIDGE_H

#include <QObject>
#include <QString>

class WebPageBridge : public QObject
{
    Q_OBJECT
public:
    explicit WebPageBridge(QObject *parent = nullptr);

signals:
    void updateComponentSource(QString source);

public slots:
};

#endif // WEBPAGEBRIDGE_H
