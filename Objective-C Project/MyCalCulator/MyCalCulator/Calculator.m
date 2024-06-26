//
//  Calculator.m
//  MyCalCulator
//

#import "Calculator.h"



@implementation Calculator
-(instancetype)init{
    self=[super init];
    if(self){
        self.operation=NONE;
        self.left=0;
        self.right=0;
    }
    return self;
}
-(NSString*)handleResult:(OPERATION)op:(NSString*)withCurrent{
    if(op==EQUAL&&self.lastOperation==EQUAL){
        NSLog(@"%@",@"log");
    }else{
        BOOL hasDot = [withCurrent containsString:@"."];
        if(hasDot){
            self.right=[withCurrent doubleValue];
        }else{
            self.right=[withCurrent intValue];
        }
    }
//    NSLog(@"%@",withCurrent);
    if(self.operation==NONE){
        self.left=self.right;
        self.operation=op;
        self.lastOperation=NONE;
        return withCurrent;
        // 读取当前line上数
    }else{
        if(self.right==0&&self.operation==DIVIDE){
            self.left=0;
            self.right=0;
            self.operation=NONE;
            return @"不是数字";
        }else if(self.right==0){
        }else if(self.operation==ADD){
            self.left+=self.right;
            self.right=op==EQUAL?self.right:0;
            self.lastOperation=op;
            self.operation=op==EQUAL?self.operation:op;
        }else if(self.operation==DECREASE){
            self.left-=self.right;
            self.right=op==EQUAL?self.right:0;
            self.lastOperation=op;
            self.operation=op==EQUAL?self.operation:op;
        }else if(self.operation==MULTIPLY){
            self.left*=self.right;
            self.right=op==EQUAL?self.right:0;
            self.lastOperation=op;
            self.operation=op==EQUAL?self.operation:op;
        }else if(self.operation==DIVIDE){
            self.left/=self.right;
            self.right=op==EQUAL?self.right:0;
            self.lastOperation=op;
            self.operation=op==EQUAL?self.operation:op;
        }else if(self.operation==MOD){
            self.left=(int)self.left%(int)self.right;
            self.right=op==EQUAL?self.right:0;
            self.lastOperation=op;
            self.operation=op==EQUAL?self.operation:op;
        }
        NSLog(@"%f",self.left);
        int reducePlace=-1;
        NSString *s=[NSString stringWithFormat:@"%f",self.left];
        if([s containsString:@"."]){
            for(int i=[s length]-1;i>0;i--){
                unichar ch=[s characterAtIndex:i];
                NSString *currentCh=[NSString stringWithCharacters:&ch length:1];
                if([currentCh isEqualToString:@"0"]){
                    continue;
                }
                if([currentCh isEqualToString:@"."]){
                    reducePlace=i;
                    break;
                }
                reducePlace=i+1;
                break;
            }
            s=[s substringToIndex:reducePlace];
        }
        return s;
    }
}
@end
