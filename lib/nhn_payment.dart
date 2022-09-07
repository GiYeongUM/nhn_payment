library nhn_payment;

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NhnPayment extends StatelessWidget {
  static const MethodChannel _channel = MethodChannel('nhn_payment');

  NhnPayment(
      {Key? key,
      required this.url,
      this.javascriptChannel,
      required this.siteCode,
      required this.paymentNumber,
      required this.payAmount,
      required this.productName,
      required this.paymentMethod,
      required this.returnUrl,
      required this.approvalKey,
      required this.payUrl,
      required this.shopUserId,
      required this.traceNo})
      : super(key: key);

  final String url;
  final String siteCode;
  final String paymentNumber;
  final int payAmount;
  final String productName;
  final String paymentMethod;
  final String returnUrl;
  final String approvalKey;
  final String payUrl;
  final String shopUserId;
  final String traceNo;
  late JavascriptChannel? javascriptChannel;
  late Completer<WebViewController> completerController;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => _goBack(context),
        child: WebView(
          debuggingEnabled: true,
          onProgress: (int progress) {},
          onWebViewCreated: (WebViewController webViewController) {
            completerController = Completer<WebViewController>();
            completerController.complete(webViewController);
            completerController.future
                .then((value) => _webViewController = value);
          },
          onPageFinished: (String url) {},
          javascriptChannels: <JavascriptChannel>{
            javascriptChannel ??= baseJavascript(context),
          },
          navigationDelegate: (NavigationRequest delegate) async {
            if (Platform.isAndroid &&
                (delegate.url.startsWith('intent://') ||
                    delegate.url.startsWith('market://'))) {
              await _channel.invokeMethod('intent', {'url': delegate.url});
              return NavigationDecision.prevent;
            } else if (Platform.isIOS &&
                (delegate.url.contains('itms-apps') ||
                    ((!delegate.url.startsWith('https') &&
                        (!delegate.url.startsWith("http")))))) {
              await _channel.invokeMethod('intent', {'url': delegate.url});
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          initialUrl: Uri.parse("$url?site_cd=$siteCode&"
                  "ordr_idxx=$paymentNumber&"
                  "good_mny=$payAmount&"
                  "good_name=$productName&"
                  "pay_method=$paymentMethod&"
                  "Ret_URL=$returnUrl&"
                  "ActionResult=${paymentMethod.toLowerCase()}&"
                  "approval_key=$approvalKey&"
                  "PayUrl=$payUrl&"
                  "currency=410&"
                  "shop_user_id=$shopUserId&"
                  "req_tx=pay&"
                  "traceNo=$traceNo&"
                  "escw_used=N")
              .toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

JavascriptChannel baseJavascript(BuildContext context) {
  return JavascriptChannel(
      name: 'ChannelName',
      onMessageReceived: (JavascriptMessage message) async {});
}
