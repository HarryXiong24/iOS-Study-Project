//
//  Calculator.h
//  MyCalCulator
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    NONE=-1,
    ADD =0,
    DECREASE=1,
    MULTIPLY=2,
    DIVIDE=3,
    MOD=4,
    EQUAL=5
}OPERATION;

@interface Calculator : NSObject

@property(nonatomic,assign)double left;
@property(nonatomic,assign)double right;
@property(nonatomic,assign)OPERATION operation;
@property(nonatomic,assign)OPERATION lastOperation;
//-(void)add:(float)added;
//-(void)decrease:(float)decreased;
//-(void)multiply:(float)multiplied;
//-(void)divide:(float)divided;
-(NSString*)handleResult:(OPERATION)op:(NSString*)withCurrent;

@end

NS_ASSUME_NONNULL_END
