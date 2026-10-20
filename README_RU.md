# FFWorks Classic - native BlackBerry 10 prototype v0.1

Нативный проект для BlackBerry Classic / BlackBerry OS 10.3.3.2049.

## Что это
- C++ / Cascades QML 1.3, НЕ Android APK.
- Встроенный Cascades WebView: https://ffworks.pro/account
- Кнопки Назад / Домой / Обновить, прогресс загрузки, статус ошибки.
- Прототип для проверки HTTPS и авторизации на реальном телефоне.

## Чего пока нет
- Готового подписанного BAR: сборка и подпись на BB10 SDK в текущем окружении не выполнены.
- Проверенной установки на устройство.
- Гарантии, что Cascades WebView работает с текущей версией сайта. Нативный WebView может отличаться от браузера BlackBerry.

## Сборка
Понадобится BlackBerry 10 Native SDK / Momentics с Cascades для ARMv7.
Откройте FFWorksClassic.pro в Momentics/Qt инструментах, соберите конфигурацию Device-Release, затем упакуйте bar-descriptor.xml штатным `blackberry-nativepackager`.
Расположение собранного `.so` зависит от настроек toolchain; путь в bar-descriptor.xml потребуется привести к фактическому пути.

Для установки на устройство необходима корректная подпись BAR или совместимый development/debug-token workflow. Не публикуйте приватные ключи в GitHub.

## Важное
Проверка сертификатов TLS не отключается. Пароли и токены авторизации не записываются программой явно. Код основан на API официальных Cascades samples.

## Источники
- https://github.com/blackberry/Cascades-Samples/blob/master/cascadescookbookqml/assets/WebView.qml
- https://github.com/blackberry/Cascades-Samples/blob/master/cascadescookbookqml/bar-descriptor.xml
- https://github.com/XIAZY/blackberry10-toolchain
