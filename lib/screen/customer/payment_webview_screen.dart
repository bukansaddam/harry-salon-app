import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewScreen extends StatelessWidget {
  const PaymentWebviewScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
          controller: WebViewController()..loadRequest(Uri.parse(url))),
    );
  }
}
