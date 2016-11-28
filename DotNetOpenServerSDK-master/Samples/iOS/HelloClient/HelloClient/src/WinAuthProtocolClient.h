//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/winauth/WinAuthProtocolClient.java
//

#include "J2ObjC_header.h"

#pragma push_macro("WinAuthProtocolClient_INCLUDE_ALL")
#ifdef WinAuthProtocolClient_RESTRICT
#define WinAuthProtocolClient_INCLUDE_ALL 0
#else
#define WinAuthProtocolClient_INCLUDE_ALL 1
#endif
#undef WinAuthProtocolClient_RESTRICT

#if !defined (ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_) && (WinAuthProtocolClient_INCLUDE_ALL || defined(ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_INCLUDE))
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_

#define WinAuthProtocol_RESTRICT 1
#define ComUsOpenserverProtocolsWinauthWinAuthProtocol_INCLUDE 1
#include "WinAuthProtocol.h"

@class ComUsOpenserverProtocolsBinaryReader;

@interface ComUsOpenserverProtocolsWinauthWinAuthProtocolClient : ComUsOpenserverProtocolsWinauthWinAuthProtocol

#pragma mark Public

- (instancetype)init;

- (jboolean)authenticateWithNSString:(NSString *)userName
                        withNSString:(NSString *)password
                        withNSString:(NSString *)domain;

- (void)onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:(ComUsOpenserverProtocolsBinaryReader *)br;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverProtocolsWinauthWinAuthProtocolClient)

inline jint ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_get_TIMEOUT();
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_TIMEOUT 120000
J2OBJC_STATIC_FIELD_CONSTANT(ComUsOpenserverProtocolsWinauthWinAuthProtocolClient, TIMEOUT, jint)

FOUNDATION_EXPORT void ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_init(ComUsOpenserverProtocolsWinauthWinAuthProtocolClient *self);

FOUNDATION_EXPORT ComUsOpenserverProtocolsWinauthWinAuthProtocolClient *new_ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_init() NS_RETURNS_RETAINED;

FOUNDATION_EXPORT ComUsOpenserverProtocolsWinauthWinAuthProtocolClient *create_ComUsOpenserverProtocolsWinauthWinAuthProtocolClient_init();

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverProtocolsWinauthWinAuthProtocolClient)

#endif

#pragma pop_macro("WinAuthProtocolClient_INCLUDE_ALL")
