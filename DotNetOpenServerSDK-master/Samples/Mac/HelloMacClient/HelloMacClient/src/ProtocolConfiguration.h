//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/ProtocolConfiguration.java
//

#include "J2ObjC_header.h"

#pragma push_macro("ProtocolConfiguration_INCLUDE_ALL")
#ifdef ProtocolConfiguration_RESTRICT
#define ProtocolConfiguration_INCLUDE_ALL 0
#else
#define ProtocolConfiguration_INCLUDE_ALL 1
#endif
#undef ProtocolConfiguration_RESTRICT

#if !defined (ComUsOpenserverProtocolsProtocolConfiguration_) && (ProtocolConfiguration_INCLUDE_ALL || defined(ComUsOpenserverProtocolsProtocolConfiguration_INCLUDE))
#define ComUsOpenserverProtocolsProtocolConfiguration_

@interface ComUsOpenserverProtocolsProtocolConfiguration : NSObject

#pragma mark Public

- (instancetype)initWithInt:(jint)id_
               withNSString:(NSString *)classPath;

- (NSString *)getClassPath;

- (jint)getId;

- (void)setClassPathWithNSString:(NSString *)classPath;

- (void)setIdWithInt:(jint)id_;

#pragma mark Protected

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverProtocolsProtocolConfiguration)

FOUNDATION_EXPORT void ComUsOpenserverProtocolsProtocolConfiguration_init(ComUsOpenserverProtocolsProtocolConfiguration *self);

FOUNDATION_EXPORT ComUsOpenserverProtocolsProtocolConfiguration *new_ComUsOpenserverProtocolsProtocolConfiguration_init() NS_RETURNS_RETAINED;

FOUNDATION_EXPORT ComUsOpenserverProtocolsProtocolConfiguration *create_ComUsOpenserverProtocolsProtocolConfiguration_init();

FOUNDATION_EXPORT void ComUsOpenserverProtocolsProtocolConfiguration_initWithInt_withNSString_(ComUsOpenserverProtocolsProtocolConfiguration *self, jint id_, NSString *classPath);

FOUNDATION_EXPORT ComUsOpenserverProtocolsProtocolConfiguration *new_ComUsOpenserverProtocolsProtocolConfiguration_initWithInt_withNSString_(jint id_, NSString *classPath) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT ComUsOpenserverProtocolsProtocolConfiguration *create_ComUsOpenserverProtocolsProtocolConfiguration_initWithInt_withNSString_(jint id_, NSString *classPath);

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverProtocolsProtocolConfiguration)

#endif

#pragma pop_macro("ProtocolConfiguration_INCLUDE_ALL")