//
//  GMEllipticCurveCryptoService.h
//  NuttyPlayGround
//
//  Created by Nuttanai on 17/8/2564 BE.
//

#import <Foundation/Foundation.h>
#import <GMEllipticCurveCrypto/GMEllipticCurveCrypto.h>
#include "BroadCastDiscovery.h"

@protocol GMEllipticCurveCryptoServiceProtocal<NSObject>
@optional - (void)discoveryEDCDidFinish:(NSString *_Nullable)data;
@end

NS_ASSUME_NONNULL_BEGIN

@interface GMEllipticCurveCryptoService : NSObject<GMEllipticCurveCryptoServiceProtocal>
+(void)initEDCHTest;
+(GMEllipticCurveCrypto *)initEDCH;
-(void) startDiscoveryEDC;
-(void) hello: (const char*) data;
@property (weak, nonatomic) id<GMEllipticCurveCryptoServiceProtocal> delegate;
@end

NS_ASSUME_NONNULL_END
