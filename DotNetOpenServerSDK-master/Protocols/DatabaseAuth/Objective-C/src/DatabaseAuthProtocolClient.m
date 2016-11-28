//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/databaseauth/DatabaseAuthProtocolClient.java
//

#include "BinaryReader.h"
#include "BinaryWriter.h"
#include "DatabaseAuthProtocol.h"
#include "DatabaseAuthProtocolClient.h"
#include "DatabaseAuthProtocolCommands.h"
#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "Level.h"
#include "PacketWriter.h"
#include "Session.h"
#include "java/io/IOException.h"
#include "java/lang/Integer.h"
#include "java/lang/InterruptedException.h"

@interface ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient ()

- (ComUsOpenserverProtocolsBinaryWriter *)createAuthenticatePacketWithNSString:(NSString *)password;

@end

__attribute__((unused)) static ComUsOpenserverProtocolsBinaryWriter *ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_createAuthenticatePacketWithNSString_(ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient *self, NSString *password);

@implementation ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient

J2OBJC_IGNORE_DESIGNATED_BEGIN
- (instancetype)init {
  ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_init(self);
  return self;
}
J2OBJC_IGNORE_DESIGNATED_END

- (jboolean)authenticateWithNSString:(NSString *)userName
                        withNSString:(NSString *)password {
  @synchronized(self) {
    if (session_ == nil) return false;
    userName_ = userName;
    ((ComUsOpenserverSessionSession *) nil_chk(session_))->UserName_ = userName;
    ComUsOpenserverProtocolsBinaryWriter *bw = ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_createAuthenticatePacketWithNSString_(self, password);
    @try {
      [session_ sendWithByteArray:[((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) toByteArray]];
    }
    @catch (JavaIoIOException *ex) {
      return false;
    }
    @finally {
      @try {
        [((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) close];
      }
      @catch (JavaIoIOException *ex) {
      }
    }
    @try {
      [self waitWithLong:ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_TIMEOUT];
    }
    @catch (JavaLangInterruptedException *ex) {
    }
    return isAuthenticated_;
  }
}

- (jboolean)authenticateBGWithNSString:(NSString *)userName
                          withNSString:(NSString *)password {
  @synchronized(self) {
    if (session_ == nil) return false;
    userName_ = userName;
    ((ComUsOpenserverSessionSession *) nil_chk(session_))->UserName_ = userName;
    ComUsOpenserverProtocolsBinaryWriter *bw = ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_createAuthenticatePacketWithNSString_(self, password);
    @try {
      ComUsOpenserverProtocolsPacketWriter *pw = new_ComUsOpenserverProtocolsPacketWriter_initWithComUsOpenserverSessionSession_withByteArray_(session_, [((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) toByteArray]);
      [pw execute];
    }
    @finally {
      @try {
        [((ComUsOpenserverProtocolsBinaryWriter *) nil_chk(bw)) close];
      }
      @catch (JavaIoIOException *ex) {
      }
    }
    @try {
      [self waitWithLong:ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_TIMEOUT];
    }
    @catch (JavaLangInterruptedException *ex) {
    }
    return isAuthenticated_;
  }
}

- (ComUsOpenserverProtocolsBinaryWriter *)createAuthenticatePacketWithNSString:(NSString *)password {
  return ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_createAuthenticatePacketWithNSString_(self, password);
}

- (void)onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:(ComUsOpenserverProtocolsBinaryReader *)br {
  @synchronized(self) {
    if (session_ == nil) return;
    jint command = [((ComUsOpenserverProtocolsBinaryReader *) nil_chk(br)) readByte];
    switch (command) {
      case ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolCommands_AUTHENTICATED:
      userId_ = JavaLangInteger_valueOfWithInt_([br readInt32]);
      isAuthenticated_ = true;
      ((ComUsOpenserverSessionSession *) nil_chk(session_))->IsAuthenticated_ = true;
      [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Info) withNSString:@"Authenticated."];
      [self notifyAll];
      break;
      case ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolCommands_ACCESS_DENIED:
      [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Notice) withNSString:@"Access denied."];
      [self notifyAll];
      break;
      case ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolCommands_ERROR:
      {
        @try {
          NSString *errorMessage = [br readString];
          [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Notice) withNSString:errorMessage];
        }
        @catch (JavaIoIOException *ex) {
        }
        [self notifyAll];
        break;
      }
      default:
      [self logWithComUsOpenserverLevel:JreLoadEnum(ComUsOpenserverLevel, Error) withNSString:NSString_formatWithNSString_withNSObjectArray_(@"Invalid or unsupported command.  Command: %d", [IOSObjectArray newArrayWithObjects:(id[]){ JavaLangInteger_valueOfWithInt_(command) } count:1 type:NSObject_class_()])];
      break;
    }
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", "DatabaseAuthProtocolClient", NULL, 0x1, NULL, NULL },
    { "authenticateWithNSString:withNSString:", "authenticate", "Z", 0x1, "Ljava.io.IOException;", NULL },
    { "authenticateBGWithNSString:withNSString:", "authenticateBG", "Z", 0x1, NULL, NULL },
    { "createAuthenticatePacketWithNSString:", "createAuthenticatePacket", "Lcom.us.openserver.protocols.BinaryWriter;", 0x2, NULL, NULL },
    { "onPacketReceivedWithComUsOpenserverProtocolsBinaryReader:", "onPacketReceived", "V", 0x1, NULL, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "TIMEOUT", "TIMEOUT", 0x19, "I", NULL, NULL, .constantValue.asInt = ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_TIMEOUT },
  };
  static const J2ObjcClassInfo _ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient = { 2, "DatabaseAuthProtocolClient", "com.us.openserver.protocols.databaseauth", NULL, 0x1, 5, methods, 1, fields, 0, NULL, 0, NULL, NULL, NULL };
  return &_ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient;
}

@end

void ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_init(ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient *self) {
  ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocol_init(self);
}

ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient *new_ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_init() {
  ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient *self = [ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient alloc];
  ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_init(self);
  return self;
}

ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient *create_ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_init() {
  return new_ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_init();
}

ComUsOpenserverProtocolsBinaryWriter *ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient_createAuthenticatePacketWithNSString_(ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient *self, NSString *password) {
  ComUsOpenserverProtocolsBinaryWriter *bw = new_ComUsOpenserverProtocolsBinaryWriter_init();
  [bw writeUInt16WithInt:ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocol_PROTOCOL_IDENTIFIER];
  [bw writeWithInt:(jbyte) ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolCommands_AUTHENTICATE];
  [bw writeStringWithNSString:self->userName_];
  [bw writeStringWithNSString:password];
  return bw;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComUsOpenserverProtocolsDatabaseauthDatabaseAuthProtocolClient)
