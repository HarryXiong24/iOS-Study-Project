//
//  ViewController.h
//  MyCalCulator
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController

@property(nonatomic,assign)CGFloat maxHeight;
@property(nonatomic,assign)CGFloat maxWidth;
@property(nonatomic,assign)BOOL shouldClean;
@property(nonatomic,strong,readwrite)Calculator *cal;
@property(nonatomic,strong,readwrite)UILabel *resultText;
@property(nonatomic,strong,readwrite)UIButton *buttonAC;
@property(nonatomic,strong,readwrite)UIButton *buttonAD;
@property(nonatomic,strong,readwrite)UIButton *buttonMod;
@property(nonatomic,strong,readwrite)UIButton *buttonDot;
@property(nonatomic,strong,readwrite)UIButton *buttonAdd;
@property(nonatomic,strong,readwrite)UIButton *buttonDecrease;
@property(nonatomic,strong,readwrite)UIButton *buttonMultiply;
@property(nonatomic,strong,readwrite)UIButton *buttonDivide;
@property(nonatomic,strong,readwrite)UIButton *buttonEqual;
@property(nonatomic,strong,readwrite)UIButton *button0;
@property(nonatomic,strong,readwrite)UIButton *button1;
@property(nonatomic,strong,readwrite)UIButton *button2;
@property(nonatomic,strong,readwrite)UIButton *button3;
@property(nonatomic,strong,readwrite)UIButton *button4;
@property(nonatomic,strong,readwrite)UIButton *button5;
@property(nonatomic,strong,readwrite)UIButton *button6;
@property(nonatomic,strong,readwrite)UIButton *button7;
@property(nonatomic,strong,readwrite)UIButton *button8;
@property(nonatomic,strong,readwrite)UIButton *button9;
-(void)initResultArea;
-(void)initButtons;

@end

