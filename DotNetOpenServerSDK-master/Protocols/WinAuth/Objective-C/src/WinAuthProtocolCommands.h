//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/winauth/WinAuthProtocolCommands.java
//

#include "J2ObjC_header.h"

#pragma push_macro("WinAuthProtocolCommands_INCLUDE_ALL")
#ifdef WinAuthProtocolCommands_RESTRICT
#define WinAuthProtocolCommands_INCLUDE_ALL 0
#else
#define WinAuthProtocolCommands_INCLUDE_ALL 1
#endif
#undef WinAuthProtocolCommands_RESTRICT

#if !defined (ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_) && (WinAuthProtocolCommands_INCLUDE_ALL || defined(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_INCLUDE))
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_

@interface ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands : NSObject

#pragma mark Public

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands)

inline jint ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_get_AUTHENTICATE();
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_AUTHENTICATE 1
J2OBJC_STATIC_FIELD_CONSTANT(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands, AUTHENTICATE, jint)

inline jint ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_get_AUTHENTICATED();
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_AUTHENTICATED 2
J2OBJC_STATIC_FIELD_CONSTANT(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands, AUTHENTICATED, jint)

inline jint ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_get_ACCESS_DENIED();
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_ACCESS_DENIED 3
J2OBJC_STATIC_FIELD_CONSTANT(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands, ACCESS_DENIED, jint)

inline jint ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_get_ERROR();
#define ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_ERROR 255
J2OBJC_STATIC_FIELD_CONSTANT(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands, ERROR, jint)

FOUNDATION_EXPORT void ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_init(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands *self);

FOUNDATION_EXPORT ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands *new_ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_init() NS_RETURNS_RETAINED;

FOUNDATION_EXPORT ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands *create_ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands_init();

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverProtocolsWinauthWinAuthProtocolCommands)

#endif

#pragma pop_macro("WinAuthProtocolCommands_INCLUDE_ALL")