//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ./com/us/openserver/protocols/BinaryWriter.java
//

#ifndef _ComUsOpenserverProtocolsBinaryWriter_H_
#define _ComUsOpenserverProtocolsBinaryWriter_H_

#include "J2ObjC_header.h"
#include "java/io/ByteArrayOutputStream.h"

@class IOSIntArray;
@class JavaMathBigDecimal;
@class JavaUtilGregorianCalendar;

@interface ComUsOpenserverProtocolsBinaryWriter : JavaIoByteArrayOutputStream

#pragma mark Public

- (instancetype)init;

- (void)writeWithJavaMathBigDecimal:(JavaMathBigDecimal *)value;

- (void)writeWithJavaUtilGregorianCalendar:(JavaUtilGregorianCalendar *)date;

- (void)writeWithLong:(jlong)value;

- (void)writeBooleanWithBoolean:(jboolean)value;

- (void)writeIntWithInt:(jint)value;

- (void)writeStringWithNSString:(NSString *)value;

- (void)writeUIntWithInt:(jint)value;

- (void)writeUInt16WithInt:(jint)value;

- (void)writeUInt16sWithIntArray:(IOSIntArray *)value;

@end

J2OBJC_EMPTY_STATIC_INIT(ComUsOpenserverProtocolsBinaryWriter)

FOUNDATION_EXPORT void ComUsOpenserverProtocolsBinaryWriter_init(ComUsOpenserverProtocolsBinaryWriter *self);

FOUNDATION_EXPORT ComUsOpenserverProtocolsBinaryWriter *new_ComUsOpenserverProtocolsBinaryWriter_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ComUsOpenserverProtocolsBinaryWriter)

#endif // _ComUsOpenserverProtocolsBinaryWriter_H_
