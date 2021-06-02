#import "RiskifiedPlugin.h"
#if __has_include(<riskified/riskified-Swift.h>)
#import <riskified/riskified-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "riskified-Swift.h"
#endif

@implementation RiskifiedPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRiskifiedPlugin registerWithRegistrar:registrar];
}
@end
