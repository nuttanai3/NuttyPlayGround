//
//  GMEllipticCurveCryptoService.m
//  NuttyPlayGround
//
//  Created by Nuttanai on 17/8/2564 BE.
//

#import "GMEllipticCurveCryptoService.h"

//void *delegateToClass = NULL;

@implementation GMEllipticCurveCryptoService
@synthesize delegate;
NSString *aString;

+ (void)initEDCHTest {
//    GMEllipticCurveCrypto *alice = [GMEllipticCurveCrypto cryptoForCurve: GMEllipticCurveSecp256r1];
//    NSString *alicePrivateKey = @"AehqRTo/JcuFvyybHgwjvt/APp5kkRe/VNYcjjUdT60=";
//    NSString *alicePublicKey = @"A7B8ntj/lWje9y4xiWmycCWVtc4kVLBFodnUfyETg7cV";
//    alice.privateKeyBase64 = alicePrivateKey;

//    GMEllipticCurveCrypto *bob = [GMEllipticCurveCrypto cryptoForCurve: GMEllipticCurveSecp256r1];
//    NSString *bobPrivateKey = @"G1PnR146I/U/0+ReAzYZW+NtMT/TI8tu3iqRZ5razfA=";
//    NSString *bobPublicKey = @"A6H/0GidEoes4D0pwnbRY05QPqG+W/ImEc9QGwzdYve7";
//    bob.privateKeyBase64 = bobPrivateKey;

//    NSData *aliceSharedSecret = [alice sharedSecretForPublicKeyBase64:bobPublicKey];
//    NSLog(@"Shared Secret Alice: %@", aliceSharedSecret);
//    NSData *bobSharedSecret = [bob sharedSecretForPublicKeyBase64:alicePublicKey];
//    NSLog(@"Shared Secret Bob: %@", bobSharedSecret);
    
//    NSLog(@"Shared secrets equal? %d", [aliceSharedSecret isEqualToData:bobSharedSecret]);
    
    GMEllipticCurveCrypto *alpha = [GMEllipticCurveCrypto generateKeyPairForCurve: GMEllipticCurveSecp256r1];
    GMEllipticCurveCrypto *beta = [GMEllipticCurveCrypto generateKeyPairForCurve: GMEllipticCurveSecp256r1];
    NSData *alphaSharedSecret = [alpha sharedSecretForPublicKeyBase64:[NSString stringWithFormat:@"%@", beta.publicKeyBase64]];
    NSData *betaSharedSecret = [beta sharedSecretForPublicKeyBase64:[NSString stringWithFormat:@"%@", alpha.publicKeyBase64]];
    NSLog(@"256r1");
    NSLog(@"PrivateKey Alpha: %@", alpha.privateKeyBase64);
    NSLog(@"Public64 Alpha: %@", alpha.publicKeyBase64);
    NSLog(@"PrivateKey Beta: %@", beta.privateKeyBase64);
    NSLog(@"Public64 Beta: %@", beta.publicKeyBase64);
    NSLog(@"Shared Secret Alpha: %@", alphaSharedSecret);
    NSLog(@"Shared Secret Beta: %@", betaSharedSecret);
    NSLog(@"Shared secrets equal? %d", [alphaSharedSecret isEqualToData:betaSharedSecret]);
//    NSString *myString = [[NSString alloc] initWithData:alphaSharedSecret encoding:NSASCIIStringEncoding];
//    NSLog(@"%@", myString); // foo
}

+ (GMEllipticCurveCrypto *)initEDCH{
    return [GMEllipticCurveCrypto generateKeyPairForCurve: GMEllipticCurveSecp256r1];
}

void delegateFoundDevice(const char* data){
        printf("%s",data);
//    self.hello(data);
    
    GMEllipticCurveCryptoService *viewA = CFBridgingRelease(delegateToClass);
    [viewA hello:data];
}

-(void) hello: (const char*) data{
    NSString *dataString = [NSString stringWithUTF8String: data];
    [delegate discoveryEDCDidFinish:dataString];
    aString = @"";
}

-(void) startDiscoveryEDC {
    delegateToClass = CFBridgingRetain(self);
    StartPOSProcessCCallBack(delegateFoundDevice);
    return;
}
@end
