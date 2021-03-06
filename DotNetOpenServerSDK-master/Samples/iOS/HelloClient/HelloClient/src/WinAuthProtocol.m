//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/winauth/WinAuthProtocol.java
//

#include "AuthenticationProtocolBase.h"
#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "Level.h"
#include "Session.h"
#include "WinAuthProtocol.h"

@implementation ComUsOpenserverProtocolsWinauthWinAuthProtocol

J2OBJC_IGNORE_DESIGNATED_BEGIN
- (instancetype)init {
  ComUsOpenserverProtocolsWinauthWinAuthProtocol_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END

- (void)logWithComUsOpenserverLevel:(ComUsOpenserverLevel *)level
                       withNSString:(NSString *)message {
  [((ComUsOpenserverSessionSession *) nil_chk(session_)) logWithComUsOpenserverLevel:level withNSString:NSString_formatWithNSString_withNSObjectArray_(@"[WinAuth] %s", [IOSObjectArray newArrayWithObjects:(id[]){ message } count:1 type:NSObject_class_()])];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", "WinAuthProtocol", NULL, 0x4, NULL, NULL },
    { "logWithComUsOpenserverLevel:withNSString:", "log", "V", 0x4, NULL, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "PROTOCOL_IDENTIFIER", "PROTOCOL_IDENTIFIER", 0x19, "I", NULL, NULL, .constantValue.asInt = ComUsOpenserverProtocolsWinauthWinAuthProtocol_PROTOCOL_IDENTIFIER },
  };
  static const J2ObjcClassInfo _ComUsOpenserverProtocolsWinauthWinAuthProtocol = { 2, "WinAuthProtocol", "com.us.openserver.protocols.winauth", NULL, 0x1, 2, methods, 1, fields, 0, NULL, 0, NULL, NULL, NULL };
  return &_ComUsOpenserverProtocolsWinauthWinAuthProtocol;
}

@end

void ComUsOpenserverProtocolsWinauthWinAuthProtocol_init(ComUsOpenserverProtocolsWinauthWinAuthProtocol *self) {
  ComUsOpenserverProtocolsAuthenticationProtocolBase_init(self);
}

ComUsOpenserverProtocolsWinauthWinAuthProtocol *new_ComUsOpenserverProtocolsWinauthWinAuthProtocol_init() {
  ComUsOpenserverProtocolsWinauthWinAuthProtocol *self = [ComUsOpenserverProtocolsWinauthWinAuthProtocol alloc];
  ComUsOpenserverProtocolsWinauthWinAuthProtocol_init(self);
  return self;
}

ComUsOpenserverProtocolsWinauthWinAuthProtocol *create_ComUsOpenserverProtocolsWinauthWinAuthProtocol_init() {
  return new_ComUsOpenserverProtocolsWinauthWinAuthProtocol_init();
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComUsOpenserverProtocolsWinauthWinAuthProtocol)
