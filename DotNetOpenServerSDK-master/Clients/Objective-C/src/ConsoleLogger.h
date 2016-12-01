//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/ConsoleLogger.java
//

#include "J2ObjC_header.h"

#pragma push_macro("ConsoleLogger_INCLUDE_ALL")
#ifdef ConsoleLogger_RESTRICT
#define ConsoleLogger_INCLUDE_ALL 0
#else
#define ConsoleLogger_INCLUDE_ALL 1
#endif
#undef ConsoleLogger_RESTRICT

#if !defined (ComUsOpenserverConsoleLogger_) && (ConsoleLogger_INCLUDE_ALL || defined(ComUsOpenserverConsoleLogger_INCLUDE))
#define ComUsOpenserverConsoleLogger_

#define Logger_RESTRICT 1
#define ComUsOpenserverLogger_INCLUDE 1
#include "Logger.h"

@class ComUsOpenserverLevel;

@interface ComUsOpenserverConsoleLogger : ComUsOpenserverLogger

#pragma mark Public

- (instancetype)init;

- (void)logWithComUsOpenserverLevel:(ComUsOpenserverLevel *)level
                       withNSString:(NSString *)message;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverConsoleLogger)

FOUNDATION_EXPORT void ComUsOpenserverConsoleLogger_init(ComUsOpenserverConsoleLogger *self);

FOUNDATION_EXPORT ComUsOpenserverConsoleLogger *new_ComUsOpenserverConsoleLogger_init() NS_RETURNS_RETAINED;

FOUNDATION_EXPORT ComUsOpenserverConsoleLogger *create_ComUsOpenserverConsoleLogger_init();

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverConsoleLogger)

#endif

#pragma pop_macro("ConsoleLogger_INCLUDE_ALL")