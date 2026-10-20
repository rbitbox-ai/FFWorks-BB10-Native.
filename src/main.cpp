#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <QObject>

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    Application app(argc, argv);
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(&app);
    if (!qml || qml->hasErrors()) return 1;
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    if (!root) return 2;
    app.setScene(root);
    return Application::exec();
}
