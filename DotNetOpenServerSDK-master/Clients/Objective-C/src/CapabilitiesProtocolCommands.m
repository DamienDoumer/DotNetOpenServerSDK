//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/CapabilitiesProtocolCommands.java
//

#include "CapabilitiesProtocolCommands.h"
#include "J2ObjC_source.h"

@implementation ComUsOpenserverProtocolsCapabilitiesProtocolCommands

J2OBJC_IGNORE_DESIGNATED_BEGIN
- (instancetype)init {
  ComUsOpenserverProtocolsCapabilitiesProtocolCommands_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "GET_PROTOCOL_IDS", "GET_PROTOCOL_IDS", 0x19, "I", NULL, NULL, .constantValue.asInt = ComUsOpenserverProtocolsCapabilitiesProtocolCommands_GET_PROTOCOL_IDS },
    { "PROTOCOL_IDS", "PROTOCOL_IDS", 0x19, "I", NULL, NULL, .constantValue.asInt = ComUsOpenserverProtocolsCapabilitiesProtocolCommands_PROTOCOL_IDS },
    { "ERROR", "ERROR", 0x19, "I", NULL, NULL, .constantValue.asInt = ComUsOpenserverProtocolsCapabilitiesProtocolCommands_ERROR },
  };
  static const J2ObjcClassInfo _ComUsOpenserverProtocolsCapabilitiesProtocolCommands = { 2, "CapabilitiesProtocolCommands", "com.us.openserver.protocols", NULL, 0x1, 1, methods, 3, fields, 0, NULL, 0, NULL, NULL, NULL };
  return &_ComUsOpenserverProtocolsCapabilitiesProtocolCommands;
}

@end

void ComUsOpenserverProtocolsCapabilitiesProtocolCommands_init(ComUsOpenserverProtocolsCapabilitiesProtocolCommands *self) {
  NSObject_init(self);
}

ComUsOpenserverProtocolsCapabilitiesProtocolCommands *new_ComUsOpenserverProtocolsCapabilitiesProtocolCommands_init() {
  ComUsOpenserverProtocolsCapabilitiesProtocolCommands *self = [ComUsOpenserverProtocolsCapabilitiesProtocolCommands alloc];
  ComUsOpenserverProtocolsCapabilitiesProtocolCommands_init(self);
  return self;
}

ComUsOpenserverProtocolsCapabilitiesProtocolCommands *create_ComUsOpenserverProtocolsCapabilitiesProtocolCommands_init() {
  return new_ComUsOpenserverProtocolsCapabilitiesProtocolCommands_init();
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComUsOpenserverProtocolsCapabilitiesProtocolCommands)