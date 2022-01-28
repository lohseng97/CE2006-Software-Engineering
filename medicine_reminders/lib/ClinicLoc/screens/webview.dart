import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../UI/screens/drawer.dart';
import '../../UI/screens/tab_screen_home.dart';

/// Takes a URL and show the web page to the user.
///
/// This requires an active internet connection, or the web browser in the app
/// will output "Web page not available" error.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 23 March 2021

class WebViewContainer extends StatefulWidget {
  final link;

  WebViewContainer(this.link);

  @override
  createState() => _WebViewContainerState(this.link);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _link;
  final _key = UniqueKey();

  _WebViewContainerState(this._link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CHAS Clinic Locator'),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: TabScreen(3),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _link))
          ],
        ));
  }
}
