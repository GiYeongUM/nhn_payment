#import "NhnPaymentPlugin.h"
#if __has_include(<nhn_payment/nhn_payment-Swift.h>)
#import <nhn_payment/nhn_payment-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nhn_payment-Swift.h"
#endif

@implementation NhnPaymentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNhnPaymentPlugin registerWithRegistrar:registrar];
}
@end
