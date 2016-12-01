//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/ProtocolBase.java
//

#include "BinaryReader.h"
#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "Level.h"
#include "ProtocolBase.h"
#include "ProtocolConfiguration.h"
#include "Session.h"
#include "java/io/IOException.h"

@implementation ComUsOpenserverProtocolsProtocolBase

- (void)initialize__WithComUsOpenserverSessionSession:(ComUsOpenserverSessionSession *)session
    withComUsOpenserverProtocolsProtocolConfiguration:(ComUsOpenserverProtocolsProtocolConfiguration *)pc
                                               withId:(id)userData {
  self->session_ = session;
}

- (void)close {
}

- (void)dispose {
}

- (void)onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:(ComUsOpenserverProtocolsBinaryReader *)br {
}

- (void)onErrorReceivedWithNSString:(NSString *)message {
  @synchronized(self) {
    [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Error) withNSString:message];
    [self notifyAll];
  }
}

- (void)logWithComUsOpenserverLevel:(ComUsOpenserverLevel *)level
                       withNSString:(NSString *)message {
  [((ComUsOpenserverSessionSession *) nil_chk(session_)) logWithComUsOpenserverLevel:level withNSString:NSString_formatWithNSString_withNSObjectArray_(@"[ProtocolBase] %s", [IOSObjectArray newArrayWithObjects:(id[]){ message } count:1 type:NSObject_class_()])];
}

J2OBJC_IGNORE_DESIGNATED_BEGIN
- (instancetype)init {
  ComUsOpenserverProtocolsProtocolBase_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initialize__WithComUsOpenserverSessionSession:withComUsOpenserverProtocolsProtocolConfiguration:withId:", "initialize", "V", 0x1, NULL, NULL },
    { "close", NULL, "V", 0x1, NULL, NULL },
    { "dispose", NULL, "V", 0x1, NULL, NULL },
    { "onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:", "onPacketReceived", "V", 0x1, "Ljava.io.IOException;", NULL },
    { "onErrorReceivedWithNSString:", "onErrorReceived", "V", 0x1, NULL, NULL },
    { "logWithComUsOpenserverLevel:withNSString:", "log", "V", 0x4, NULL, NULL },
    { "init", NULL, NULL, 0x1, NULL, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "session_", NULL, 0x4, "Lcom.us.openserver.session.Session;", NULL, NULL, .constantValue.asLong = 0 },
  };
  static const J2ObjcClassInfo _ComUsOpenserverProtocolsProtocolBase = { 2, "ProtocolBase", "com.us.openserver.protocols", NULL, 0x401, 7, methods, 1, fields, 0, NULL, 0, NULL, NULL, NULL };
  return &_ComUsOpenserverProtocolsProtocolBase;
}

@end

void ComUsOpenserverProtocolsProtocolBase_init(ComUsOpenserverProtocolsProtocolBase *self) {
  NSObject_init(self);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComUsOpenserverProtocolsProtocolBase)