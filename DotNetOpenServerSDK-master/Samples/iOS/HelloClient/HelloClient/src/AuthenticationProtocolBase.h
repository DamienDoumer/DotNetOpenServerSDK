//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/AuthenticationProtocolBase.java
//

#include "J2ObjC_header.h"

#pragma push_macro("AuthenticationProtocolBase_INCLUDE_ALL")
#ifdef AuthenticationProtocolBase_RESTRICT
#define AuthenticationProtocolBase_INCLUDE_ALL 0
#else
#define AuthenticationProtocolBase_INCLUDE_ALL 1
#endif
#undef AuthenticationProtocolBase_RESTRICT

#if !defined (ComUsOpenserverProtocolsAuthenticationProtocolBase_) && (AuthenticationProtocolBase_INCLUDE_ALL || defined(ComUsOpenserverProtocolsAuthenticationProtocolBase_INCLUDE))
#define ComUsOpenserverProtocolsAuthenticationProtocolBase_

#define ProtocolBase_RESTRICT 1
#define ComUsOpenserverProtocolsProtocolBase_INCLUDE 1
#include "ProtocolBase.h"

@interface ComUsOpenserverProtocolsAuthenticationProtocolBase : ComUsOpenserverProtocolsProtocolBase {
 @public
  jboolean isAuthenticated_;
  NSString *userName_;
  id userId_;
}

#pragma mark Public

- (instancetype)init;

- (jboolean)getIsAuthenticated;

- (id)getUserId;

- (NSString *)getUserName;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverProtocolsAuthenticationProtocolBase)

J2OBJC_FIELD_SETTER(ComUsOpenserverProtocolsAuthenticationProtocolBase, userName_, NSString *)
J2OBJC_FIELD_SETTER(ComUsOpenserverProtocolsAuthenticationProtocolBase, userId_, id)

FOUNDATION_EXPORT void ComUsOpenserverProtocolsAuthenticationProtocolBase_init(ComUsOpenserverProtocolsAuthenticationProtocolBase *self);

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverProtocolsAuthenticationProtocolBase)

#endif

#pragma pop_macro("AuthenticationProtocolBase_INCLUDE_ALL")