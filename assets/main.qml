import bb.cascades 1.3

Page {
    id: page
    property string homeUrl: "https://ffworks.pro/account"
    titleBar: TitleBar {
        title: "FFWorks Classic"
    }
    Container {
        layout: DockLayout {}
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                leftPadding: 8
                rightPadding: 8
                topPadding: 8
                bottomPadding: 8
                Button {
                    text: "Назад"
                    layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                    onClicked: { web.goBack(); }
                }
                Button {
                    text: "Домой"
                    layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                    onClicked: { web.url = page.homeUrl; }
                }
                Button {
                    text: "Обновить"
                    layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                    onClicked: { web.reload(); }
                }
            }
            Label {
                id: statusLabel
                text: "Загрузка FFWorks..."
                textStyle.fontSize: FontSize.XSmall
                leftMargin: 12
                rightMargin: 12
                multiline: true
            }
            ProgressIndicator {
                id: progress
                opacity: 1.0
                value: 0.0
            }
            ScrollView {
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                scrollViewProperties {
                    scrollMode: ScrollMode.Both
                    pinchToZoomEnabled: true
                }
                WebView {
                    id: web
                    url: page.homeUrl
                    settings.viewport: { "width": "device-width", "initial-scale": 1.0 }
                    onLoadProgressChanged: { progress.value = loadProgress / 100.0; }
                    onLoadingChanged: {
                        if (loadRequest.status == WebLoadStatus.Started) {
                            statusLabel.text = "Загрузка: " + web.url;
                            progress.opacity = 1.0;
                        } else if (loadRequest.status == WebLoadStatus.Succeeded) {
                            statusLabel.text = "FFWorks";
                            progress.opacity = 0.0;
                        } else if (loadRequest.status == WebLoadStatus.Failed) {
                            statusLabel.text = "Не удалось открыть страницу: " + web.url;
                            progress.opacity = 0.0;
                        }
                    }
                }
            }
        }
    }
}
