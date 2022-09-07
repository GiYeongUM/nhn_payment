import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nhn_payment/nhn_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: NhnPayment(
            url: "https://testsmpay.kcp.co.kr/pay/mobileGW.kcp",
            siteCode: "T0000",
            paymentNumber: "P003004", // Required to register information on the server
            payAmount: 900, // Required to register information on the server
            productName: "ProductName",
            paymentMethod: "CARD",
            returnUrl: "returnUrl", // Server Return URL
            approvalKey: "TyxeVZQwsdLqK9QEmhJSfQcHyKIPdQ/iE35VBPEo1cQ=", // approvalKey
            payUrl: "https://testsmpay.kcp.co.kr/pay/mobileGW.kcp",
            shopUserId: "1",
            traceNo: "T00001L7892"
        ),
      ),
    );
  }
}
