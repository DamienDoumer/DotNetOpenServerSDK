//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/session/SessionCloser.java
//

#include "J2ObjC_header.h"

#pragma push_macro("SessionCloser_INCLUDE_ALL")
#ifdef SessionCloser_RESTRICT
#define SessionCloser_INCLUDE_ALL 0
#else
#define SessionCloser_INCLUDE_ALL 1
#endif
#undef SessionCloser_RESTRICT

#if !defined (ComUsOpenserverSessionSessionCloser_) && (SessionCloser_INCLUDE_ALL || defined(ComUsOpenserverSessionSessionCloser_INCLUDE))
#define ComUsOpenserverSessionSessionCloser_

#define JavaLangRunnable_RESTRICT 1
#define JavaLangRunnable_INCLUDE 1
#include "java/lang/Runnable.h"

@class ComUsOpenserverSessionSession;

@interface ComUsOpenserverSessionSessionCloser : NSObject < JavaLangRunnable >

#pragma mark Public

- (instancetype)initWithComUsOpenserverSessionSession:(ComUsOpenserverSessionSession *)session;

- (void)close;

- (void)closeWithInt:(jint)protocolId;

- (void)closeBackgroundThread;

- (void)closeBackgroundThreadWithInt:(jint)protocolId;

- (void)run;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverSessionSessionCloser)

FOUNDATION_EXPORT void ComUsOpenserverSessionSessionCloser_initWithComUsOpenserverSessionSession_(ComUsOpenserverSessionSessionCloser *self, ComUsOpenserverSessionSession *session);

FOUNDATION_EXPORT ComUsOpenserverSessionSessionCloser *new_ComUsOpenserverSessionSessionCloser_initWithComUsOpenserverSessionSession_(ComUsOpenserverSessionSession *session) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT ComUsOpenserverSessionSessionCloser *create_ComUsOpenserverSessionSessionCloser_initWithComUsOpenserverSessionSession_(ComUsOpenserverSessionSession *session);

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverSessionSessionCloser)

#endif

#pragma pop_macro("SessionCloser_INCLUDE_ALL")
