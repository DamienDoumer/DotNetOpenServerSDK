//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/hello/HelloProtocolClient.java
//

#include "BinaryReader.h"
#include "BinaryWriter.h"
#include "HelloProtocol.h"
#include "HelloProtocolClient.h"
#include "IHelloProtocolObserver.h"
#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "Level.h"
#include "PacketWriter.h"
#include "Session.h"
#include "java/io/IOException.h"
#include "java/lang/Exception.h"

@interface ComUsOpenserverProtocolsHelloHelloProtocolClient () {
 @public
  id<ComUsOpenserverProtocolsHelloIHelloProtocolObserver> callbackInterface_;
  NSString *serverResponse_;
}

- (ComUsOpenserverProtocolsBinaryWriter *)CreateCommandPacketWithNSString:(NSString *)message;

@end

J2OBJC_FIELD_SETTER(ComUsOpenserverProtocolsHelloHelloProtocolClient, callbackInterface_, id<ComUsOpenserverProtocolsHelloIHelloProtocolObserver>)
J2OBJC_FIELD_SETTER(ComUsOpenserverProtocolsHelloHelloProtocolClient, serverResponse_, NSString *)

__attribute__((unused)) static ComUsOpenserverProtocolsBinaryWriter *ComUsOpenserverProtocolsHelloHelloProtocolClient_CreateCommandPacketWithNSString_(ComUsOpenserverProtocolsHelloHelloProtocolClient *self, NSString *message);

@implementation ComUsOpenserverProtocolsHelloHelloProtocolClient

- (void)setHelloObserverWithComUsOpenserverProtocolsHelloIHelloProtocolObserver:(id<ComUsOpenserverProtocolsHelloIHelloProtocolObserver>)callbackInterface {
  self->callbackInterface_ = callbackInterface;
}

- (void)onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:(ComUsOpenserverProtocolsBinaryReader *)br {
  @synchronized(self) {
    serverResponse_ = [((ComUsOpenserverProtocolsBinaryReader *) nil_chk(br)) readString];
    [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Info) withNSString:NSString_formatWithNSString_withNSObjectArray_(@"Server responded: %s", [IOSObjectArray newArrayWithObjects:(id[]){ serverResponse_ } count:1 type:NSObject_class_()])];
    [self notifyAll];
  }
  if (callbackInterface_ != nil) [callbackInterface_ onHelloCompleteWithNSString:serverResponse_];
}

- (NSString *)helloWithNSString:(NSString *)message {
  @synchronized(self) {
    [self helloAsyncWithNSString:message];
    [self waitWithLong:10000];
  }
  return serverResponse_;
}

- (void)helloAsyncWithNSString:(NSString *)message {
  ComUsOpenserverProtocolsBinaryWriter *bw = ComUsOpenserverProtocolsHelloHelloProtocolClient_CreateCommandPacketWithNSString_(self, message);
  @try {
    [((ComUsOpenserverSessionSession *) nil_chk(session_)) sendWithByteArray:[((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) toByteArray]];
  }
  @finally {
    @try {
      [((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) close];
    }
    @catch (JavaIoIOException *ex) {
    }
  }
}

- (NSString *)helloBackgroundThreadWithNSString:(NSString *)message {
  @synchronized(self) {
    [self helloBackgroundThreadAsyncWithNSString:message];
    [self waitWithLong:10000];
  }
  return serverResponse_;
}

- (void)helloBackgroundThreadAsyncWithNSString:(NSString *)message {
  ComUsOpenserverProtocolsBinaryWriter *bw = ComUsOpenserverProtocolsHelloHelloProtocolClient_CreateCommandPacketWithNSString_(self, message);
  @try {
    [new_ComUsOpenserverProtocolsPacketWriter_initWithComUsOpenserverSessionSession_withByteArray_(session_, [((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) toByteArray]) execute];
  }
  @finally {
    @try {
      [((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) close];
    }
    @catch (JavaIoIOException *ex) {
    }
  }
}

- (ComUsOpenserverProtocolsBinaryWriter *)CreateCommandPacketWithNSString:(NSString *)message {
  return ComUsOpenserverProtocolsHelloHelloProtocolClient_CreateCommandPacketWithNSString_(self, message);
}

J2OBJC_IGNORE_DESIGNATED_BEGIN
- (instancetype)init {
  ComUsOpenserverProtocolsHelloHelloProtocolClient_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "setHelloObserverWithComUsOpenserverProtocolsHelloIHelloProtocolObserver:", "setHelloObserver", "V", 0x1, NULL, NULL },
    { "onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:", "onPacketReceived", "V", 0x1, "Ljava.io.IOException;", NULL },
    { "helloWithNSString:", "hello", "Ljava.lang.String;", 0x1, "Ljava.lang.Exception;", NULL },
    { "helloAsyncWithNSString:", "helloAsync", "V", 0x1, "Ljava.lang.Exception;", NULL },
    { "helloBackgroundThreadWithNSString:", "helloBackgroundThread", "Ljava.lang.String;", 0x1, "Ljava.lang.Exception;", NULL },
    { "helloBackgroundThreadAsyncWithNSString:", "helloBackgroundThreadAsync", "V", 0x1, "Ljava.lang.Exception;", NULL },
    { "CreateCommandPacketWithNSString:", "CreateCommandPacket", "Lcom.us.openserver.protocols.BinaryWriter;", 0x2, "Ljava.io.IOException;", NULL },
    { "init", NULL, NULL, 0x1, NULL, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "callbackInterface_", NULL, 0x2, "Lcom.us.openserver.protocols.hello.IHelloProtocolObserver;", NULL, NULL, .constantValue.asLong = 0 },
    { "serverResponse_", NULL, 0x2, "Ljava.lang.String;", NULL, NULL, .constantValue.asLong = 0 },
  };
  static const J2ObjcClassInfo _ComUsOpenserverProtocolsHelloHelloProtocolClient = { 2, "HelloProtocolClient", "com.us.openserver.protocols.hello", NULL, 0x1, 8, methods, 2, fields, 0, NULL, 0, NULL, NULL, NULL };
  return &_ComUsOpenserverProtocolsHelloHelloProtocolClient;
}

@end

ComUsOpenserverProtocolsBinaryWriter *ComUsOpenserverProtocolsHelloHelloProtocolClient_CreateCommandPacketWithNSString_(ComUsOpenserverProtocolsHelloHelloProtocolClient *self, NSString *message) {
  ComUsOpenserverProtocolsBinaryWriter *bw = new_ComUsOpenserverProtocolsBinaryWriter_init();
  [bw writeUInt16WithInt:ComUsOpenserverProtocolsHelloHelloProtocol_PROTOCOL_IDENTIFIER];
  [bw writeStringWithNSString:message];
  [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Info) withNSString:NSString_formatWithNSString_withNSObjectArray_(@"Client says: %s", [IOSObjectArray newArrayWithObjects:(id[]){ message } count:1 type:NSObject_class_()])];
  return bw;
}

void ComUsOpenserverProtocolsHelloHelloProtocolClient_init(ComUsOpenserverProtocolsHelloHelloProtocolClient *self) {
  ComUsOpenserverProtocolsHelloHelloProtocol_init(self);
}

ComUsOpenserverProtocolsHelloHelloProtocolClient *new_ComUsOpenserverProtocolsHelloHelloProtocolClient_init() {
  ComUsOpenserverProtocolsHelloHelloProtocolClient *self = [ComUsOpenserverProtocolsHelloHelloProtocolClient alloc];
  ComUsOpenserverProtocolsHelloHelloProtocolClient_init(self);
  return self;
}

ComUsOpenserverProtocolsHelloHelloProtocolClient *create_ComUsOpenserverProtocolsHelloHelloProtocolClient_init() {
  return new_ComUsOpenserverProtocolsHelloHelloProtocolClient_init();
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComUsOpenserverProtocolsHelloHelloProtocolClient)
