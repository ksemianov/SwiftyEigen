#import "EIGMatrix.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <Eigen/Dense>
#pragma clang diagnostic pop

#import <iostream>

using Matrix = Eigen::Matrix<float, Eigen::Dynamic, Eigen::Dynamic>;
using Map = Eigen::Map<Matrix>;

@interface EIGMatrix ()

@property (readonly) Matrix matrix;

- (instancetype)initWithMatrix:(Matrix)matrix;

@end

@implementation EIGMatrix

- (instancetype)initWithMatrix:(Matrix)matrix {
    self = [super init];
    _matrix = matrix;
    return self;
}

- (ptrdiff_t)rows {
    return _matrix.rows();
}

- (ptrdiff_t)cols {
    return _matrix.cols();
}

+ (instancetype)matrixWithZeros:(ptrdiff_t)rows cols:(ptrdiff_t)cols {
    return [[EIGMatrix alloc] initWithMatrix:Matrix::Zero(rows, cols)];
}

+ (instancetype)matrixWithIdentity:(ptrdiff_t)rows cols:(ptrdiff_t)cols {
    return [[EIGMatrix alloc] initWithMatrix:Matrix::Identity(rows, cols)];
}

- (float)valueAtRow:(ptrdiff_t)row col:(ptrdiff_t)col {
    return _matrix(row, col);
}

- (void)setValue:(float)value row:(ptrdiff_t)row col:(ptrdiff_t)col {
    _matrix(row, col) = value;
}

- (instancetype)inverse {
    const Matrix result = _matrix.inverse();
    return [[EIGMatrix alloc] initWithMatrix:result];
}

- (NSString*)description {
    std::stringstream buffer;
    buffer << _matrix;
    const std::string string = buffer.str();
    return [NSString stringWithUTF8String:string.c_str()];
}

@end
