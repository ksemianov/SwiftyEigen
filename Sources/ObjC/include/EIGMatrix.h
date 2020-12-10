#pragma once

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EIGMatrix: NSObject

@property (readonly) ptrdiff_t rows;
@property (readonly) ptrdiff_t cols;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)matrixWithZeros:(ptrdiff_t)rows cols:(ptrdiff_t)cols
NS_SWIFT_NAME(zeros(rows:cols:));
+ (instancetype)matrixWithIdentity:(ptrdiff_t)rows cols:(ptrdiff_t)cols
NS_SWIFT_NAME(identity(rows:cols:));

- (float)valueAtRow:(ptrdiff_t)row col:(ptrdiff_t)col
NS_SWIFT_NAME(value(row:col:));
- (void)setValue:(float)value row:(ptrdiff_t)row col:(ptrdiff_t)col
NS_SWIFT_NAME(setValue(_:row:col:));

- (EIGMatrix*)inverse;

@end

NS_ASSUME_NONNULL_END
