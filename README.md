# nhn_payment
Flutter NHN KCP payment plugin widget

<img width="308" alt="" src="https://github.com/GiYeongUM/nhn_payment/raw/main/images/nhn_payment_widget.jpeg">

## Develop Information
https://developer.kcp.co.kr/


## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


```yaml
dependencies:
  nhn_payment: ^<latest_version>
```

## Setting Guide

### Android

1. **app/build.gradle** `minSDK` version
``` groovy
minSdkVersion 19
```

2. **AndroidManifest.xml** `intent queries`

```xml
<manifest>
    <queries>
         <package android:name="com.shcard.smartpay" />
         <package android:name="com.shinhancard.smartshinhan" />
         <package android:name="com.hyundaicard.appcard" />
         <package android:name="com.lumensoft.touchenappfree" />
         <package android:name="kr.co.samsungcard.mpocket" />
         <package android:name="nh.smart.nhallonepay" />
         <package android:name="com.kbcard.cxh.appcard" />
         <package android:name="com.kbstar.liivbank" />
         <package android:name="com.kbstar.reboot" />
         <package android:name="kvp.jjy.MispAndroid320" />
         <package android:name="com.lcacApp" />
         <package android:name="com.hanaskcard.paycla" />
         <package android:name="kr.co.hanamembers.hmscustomer" />
         <package android:name="kr.co.citibank.citimobile" />
         <package android:name="com.wooricard.wpay" />
         <package android:name="com.wooricard.smartapp" />
         <package android:name="com.wooribank.smart.npib" />
         <package android:name="viva.republica.toss" />
         <package android:name="com.nhnent.payapp" />
         <package android:name="com.ssg.serviceapp.android.egiftcertificate" />
         <package android:name="com.kakao.talk" />
         <package android:name="com.nhn.android.search" />
         <package android:name="com.lotte.lpay" />
         <package android:name="com.lottemembers.android" />
         <package android:name="com.samsung.android.spay" />
         <package android:name="com.samsung.android.spaylite" />
         <package android:name="com.lge.lgpay" />
         <package android:name="com.TouchEn.mVaccine.webs" />
         <package android:name="kr.co.shiftworks.vguardweb" />
         <package android:name="com.ahnlab.v3mobileplus" />
         <package android:name="com.kftc.bankpay.android" />
     </queries>
</manifest>
```


### iOS

1. **Info.plist** `LSApplicationQueriesSchemes`

```Swift
<key>LSApplicationQueriesSchemes</key>
    <array>
       <string>wooripay</string>
       <string>NewSmartPib</string>
       <string>citimobileapp</string>
       <string>paycoapplogin</string>
       <string>payco</string>
       <string>lpayapp</string>
       <string>nhallonepayansimclick</string>
       <string>shinhan-sr-ansimclick</string>
       <string>smshinhanansimclick</string>
       <string>hdcardappcardansimclick</string>
       <string>smhyundaiansimclick</string>
       <string>mpocket.online.ansimclick</string>
       <string>scardcertiapp</string>
       <string>hanawalletmembers</string>
       <string>cloudpay</string>
       <string>oneqpay</string>
       <string>nhappcardansimclick</string>
       <string>nonghyupcardansimclick</string>
       <string>lotteappcard</string>
       <string>lottesmartpay</string>
       <string>kb-acp</string>
       <string>ispmobile</string>
       <string>liivbank</string>
       <string>newliiv</string>
       <string>citicardappkr</string>
       <string>citispay</string>
       <string>lmslpay</string>
       <string>shinsegaeeasypayment</string>
       <string>kakaotalk</string>
       <string>supertoss</string>
       <string>samsungpay</string>
       <string>callonlinepay</string>
       <string>com.wooricard.wcard</string>
       <string>payco://</string>
       <string>payco://payment/online/linkaccount?from=payco</string>
       <string>payco://payment/online/linkaccount?from=apple&amp;amp;url=</string>
       <string>payco://payment/online/linkaccount?from=apple</string>
       <string>naversearchapp</string>
       <string>naversearchthirdlogin</string>
       <string>kakaobeabbcd57061040ee0a7864a7f759dd0</string>
       <string>kakaokompassauth</string>
       <string>storykompassauth</string>
       <string>kakaolink</string>
       <string>kakaotalk-5.9.7</string>
    </array>
```


## 💪 Use

``` dart
NhnPayment(
    url: "https://testsmpay.kcp.co.kr/pay/mobileGW.kcp", /// this is test url
    siteCode: "T0000",
    paymentNumber: "P12203", // Required to register information on the server
    payAmount: 10000, // Required to register information on the server
    productName: "ProductName",
    paymentMethod: "CARD",
    returnUrl: "returnUrl", // Server Return URL
    approvalKey: "approvalKey", // approvalKey
    payUrl: "https://testsmpay.kcp.co.kr/pay/mobileGW.kcp", /// this is test url
    shopUserId: "1",
    traceNo: "T00001L7892",
),
```


