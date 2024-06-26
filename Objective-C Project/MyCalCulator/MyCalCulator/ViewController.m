//
//  ViewController.m
//  MyCalCulator
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed: 0.13 green: 0.19 blue: 0.33 alpha: 1.00];
    self.maxHeight=self.view.frame.size.height;
    self.maxWidth=self.view.frame.size.width;
    self.cal=[[Calculator alloc] init];
    self.shouldClean=NO;
    [self initResultArea];
    [self initButtons];
}
-(void)initResultArea{
    self.resultText=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.maxWidth, self.maxHeight/6)];
    self.resultText.backgroundColor=[UIColor colorWithRed: 0.13 green: 0.19 blue: 0.33 alpha: 1.00];
    self.resultText.textColor=[UIColor whiteColor];
    self.resultText.adjustsFontSizeToFitWidth=YES;
    self.resultText.font=[UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
    self.resultText.textAlignment=NSTextAlignmentRight;
    self.resultText.text=@"0";
    [self.view addSubview:self.resultText];
    
}

-(void)initButtons{
    // 第一行
    // AC button
    self.buttonAC=[[UIButton alloc] initWithFrame:CGRectMake(0, self.maxHeight/6, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonAC setTitle:@"AC" forState:UIControlStateNormal];
    self.buttonAC.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonAC setBackgroundColor:[UIColor colorWithRed: 0.24 green: 0.29 blue: 0.41 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonAC addTarget:self action:@selector(buttonACClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonAC addTarget:self action:@selector(buttonACClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonAC];
    // +/- button
    self.buttonAD=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/4+1, self.maxHeight/6, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonAD setTitle:@"+/-" forState:UIControlStateNormal];
    self.buttonAD.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonAD setBackgroundColor:[UIColor colorWithRed: 0.24 green: 0.29 blue: 0.41 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonAD addTarget:self action:@selector(buttonADClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonAD addTarget:self action:@selector(buttonADClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonAD];
    // % button
    self.buttonMod=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/2+2, self.maxHeight/6, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonMod setTitle:@"%" forState:UIControlStateNormal];
    self.buttonMod.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonMod setBackgroundColor:[UIColor colorWithRed: 0.24 green: 0.29 blue: 0.41 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonMod addTarget:self action:@selector(buttonModClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonMod addTarget:self action:@selector(buttonModClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonMod];
    // ÷  button
    self.buttonDivide=[[UIButton alloc] initWithFrame:CGRectMake(3*self.maxWidth/4+3, self.maxHeight/6, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonDivide setTitle:@"÷" forState:UIControlStateNormal];
    self.buttonDivide.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonDivide setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonDivide addTarget:self action:@selector(buttonDivideClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonDivide addTarget:self action:@selector(buttonDivideClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonDivide];
    //第二行
    // 7 button
    self.button7=[[UIButton alloc] initWithFrame:CGRectMake(0, self.maxHeight/3+1, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button7 setTitle:@"7" forState:UIControlStateNormal];
    self.button7.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button7 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button7 addTarget:self action:@selector(button7Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button7 addTarget:self action:@selector(button7Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button7];
    // 8 button
    self.button8=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/4+1, self.maxHeight/3+1, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button8 setTitle:@"8" forState:UIControlStateNormal];
    self.button8.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button8 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button8 addTarget:self action:@selector(button8Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button8 addTarget:self action:@selector(button8Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button8];
    // 9 button
    self.button9=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/2+2, self.maxHeight/3+1, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button9 setTitle:@"9" forState:UIControlStateNormal];
    self.button9.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button9 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button9 addTarget:self action:@selector(button9Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button9 addTarget:self action:@selector(button9Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button9];
    // × button
    self.buttonMultiply=[[UIButton alloc] initWithFrame:CGRectMake(3*self.maxWidth/4+3, self.maxHeight/3+1, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonMultiply setTitle:@"×" forState:UIControlStateNormal];
    self.buttonMultiply.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonMultiply setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonMultiply addTarget:self action:@selector(buttonMultiplyClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonMultiply addTarget:self action:@selector(buttonMultiplyClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonMultiply];
    //第三行
    // 4 button
    self.button4=[[UIButton alloc] initWithFrame:CGRectMake(0, self.maxHeight/2+2, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button4 setTitle:@"4" forState:UIControlStateNormal];
    self.button4.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button4 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button4 addTarget:self action:@selector(button4Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button4 addTarget:self action:@selector(button4Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button4];
    // 5 button
    self.button5=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/4+1, self.maxHeight/2+2, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button5 setTitle:@"5" forState:UIControlStateNormal];
    self.button5.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button5 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button5 addTarget:self action:@selector(button5Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button5 addTarget:self action:@selector(button5Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button5];
    // 6 button
    self.button6=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/2+2, self.maxHeight/2+2, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button6 setTitle:@"6" forState:UIControlStateNormal];
    self.button6.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button6 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button6 addTarget:self action:@selector(button6Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button6 addTarget:self action:@selector(button6Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button6];
    // - button
    self.buttonDecrease=[[UIButton alloc] initWithFrame:CGRectMake(3*self.maxWidth/4+3, self.maxHeight/2+2, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonDecrease setTitle:@"-" forState:UIControlStateNormal];
    self.buttonDecrease.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonDecrease setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonDecrease addTarget:self action:@selector(buttonDecreaseClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonDecrease addTarget:self action:@selector(buttonDecreaseClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonDecrease];
    //第四行
    // 1 button
    self.button1=[[UIButton alloc] initWithFrame:CGRectMake(0, 2*self.maxHeight/3+3, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button1 setTitle:@"1" forState:UIControlStateNormal];
    self.button1.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button1 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button1 addTarget:self action:@selector(button1Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    // 2 button
    self.button2=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/4+1, 2*self.maxHeight/3+3, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button2 setTitle:@"2" forState:UIControlStateNormal];
    self.button2.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button2 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button2 addTarget:self action:@selector(button2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
    // 3 button
    self.button3=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/2+2, 2*self.maxHeight/3+3, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.button3 setTitle:@"3" forState:UIControlStateNormal];
    self.button3.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button3 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button3 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button3 addTarget:self action:@selector(button3Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button3];
    // + button
    self.buttonAdd=[[UIButton alloc] initWithFrame:CGRectMake(3*self.maxWidth/4+3, 2*self.maxHeight/3+3, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonAdd setTitle:@"+" forState:UIControlStateNormal];
    self.buttonAdd.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonAdd setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonAdd addTarget:self action:@selector(buttonAddClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonAdd addTarget:self action:@selector(buttonAddClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonAdd];
    //第五行
    // 0 button
    self.button0=[[UIButton alloc] initWithFrame:CGRectMake(0, 5*self.maxHeight/6+3, self.maxWidth/2-4, self.maxHeight/6-6)];
    [self.button0 setTitle:@"0" forState:UIControlStateNormal];
    self.button0.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.button0 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.button0 addTarget:self action:@selector(button0Click) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.button0 addTarget:self action:@selector(button0Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button0];
    // . button
    self.buttonDot=[[UIButton alloc] initWithFrame:CGRectMake(self.maxWidth/2+2, 5*self.maxHeight/6+3, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonDot setTitle:@"." forState:UIControlStateNormal];
    self.buttonDot.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonDot setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonDot addTarget:self action:@selector(buttonDotClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonDot addTarget:self action:@selector(buttonDotClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonDot];
    // = button
    self.buttonEqual=[[UIButton alloc] initWithFrame:CGRectMake(3*self.maxWidth/4+3, 5*self.maxHeight/6+3, self.maxWidth/4-4, self.maxHeight/6-6)];
    [self.buttonEqual setTitle:@"=" forState:UIControlStateNormal];
    self.buttonEqual.titleLabel.font=[UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    [self.buttonEqual setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    //点击时的颜色变动
    [self.buttonEqual addTarget:self action:@selector(buttonEqualClick) forControlEvents:UIControlEventTouchDown];
    //点击后的事件回调
    [self.buttonEqual addTarget:self action:@selector(buttonEqualClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonEqual];
    
}
-(void)buttonACClick{
    [self.buttonAC setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)buttonACClicked{
    [self.buttonAC setBackgroundColor:[UIColor colorWithRed: 0.24 green: 0.29 blue: 0.41 alpha: 1.00]];
    self.resultText.text=@"0";
    self.cal.left=0;
    self.cal.right=0;
    self.cal.operation=NONE;
}
-(void)buttonADClick{
    [self.buttonAD setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)buttonADClicked{
    [self.buttonAD setBackgroundColor:[UIColor colorWithRed: 0.24 green: 0.29 blue: 0.41 alpha: 1.00]];
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"0";
    }else{
        if([self.resultText.text containsString:@"-"]){
            self.resultText.text=[self.resultText.text substringFromIndex:1];
            NSLog(@"%@",self.resultText.text);
            return;
        }
        self.resultText.text=[@"-" stringByAppendingString:self.resultText.text];
    }
}
-(void)buttonModClick{
    [self.buttonMod setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)buttonModClicked{
    [self.buttonMod setBackgroundColor:[UIColor colorWithRed: 0.24 green: 0.29 blue: 0.41 alpha: 1.00]];
    self.cal.operation=NONE;
    self.resultText.text = [self.cal handleResult:MOD :self.resultText.text];
    self.shouldClean=YES;
}
-(void)buttonMultiplyClick{
    [self.buttonMultiply setBackgroundColor:[UIColor colorWithRed: 0.77 green: 0.45 blue: 0.03 alpha: 1.00]];
}
-(void)buttonMultiplyClicked{
    [self.buttonMultiply setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    self.cal.operation=NONE;
    self.resultText.text = [self.cal handleResult:MULTIPLY :self.resultText.text];
    self.shouldClean=YES;
}
-(void)buttonAddClick{
    [self.buttonAdd setBackgroundColor:[UIColor colorWithRed: 0.77 green: 0.45 blue: 0.03 alpha: 1.00]];
}
-(void)buttonAddClicked{
    [self.buttonAdd setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    self.cal.operation=NONE;
    self.resultText.text = [self.cal handleResult:ADD :self.resultText.text];
    self.shouldClean=YES;
}
-(void)buttonDecreaseClick{
    [self.buttonDecrease setBackgroundColor:[UIColor colorWithRed: 0.77 green: 0.45 blue: 0.03 alpha: 1.00]];
}
-(void)buttonDecreaseClicked{
    [self.buttonDecrease setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    self.cal.operation=NONE;
    self.resultText.text = [self.cal handleResult:DECREASE :self.resultText.text];
    self.shouldClean=YES;
}
-(void)buttonDivideClick{
    [self.buttonDivide setBackgroundColor:[UIColor colorWithRed: 0.77 green: 0.45 blue: 0.03 alpha: 1.00]];
}
-(void)buttonDivideClicked{
    [self.buttonDivide setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    self.cal.operation=NONE;
    self.resultText.text = [self.cal handleResult:DIVIDE :self.resultText.text];
    self.shouldClean=YES;
}
-(void)buttonDotClick{
    [self.buttonDot setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)buttonDotClicked{
    [self.buttonDot setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"0";
    }else{
        // 已经存在.
        if([self.resultText.text containsString:@"."]){
            return;
        }else{
            NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
            [mStr appendString:@"."];
            self.resultText.text=[NSString stringWithString:mStr];
        }
    }
}
-(void)buttonEqualClick{
    [self.buttonEqual setBackgroundColor:[UIColor colorWithRed: 0.77 green: 0.45 blue: 0.03 alpha: 1.00]];
}
-(void)buttonEqualClicked{
    [self.buttonEqual setBackgroundColor:[UIColor colorWithRed: 1.00 green: 0.58 blue: 0.05 alpha: 1.00]];
    self.resultText.text = [self.cal handleResult:EQUAL :self.resultText.text];
    self.shouldClean=YES;
}


// NumButtons
-(void)button0Click{
    [self.button0 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button0Clicked{
    [self.button0 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"0";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"0"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button1Click{
    [self.button1 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button1Clicked{
    [self.button1 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"1";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"1"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button2Click{
    [self.button2 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button2Clicked{
    [self.button2 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"2";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"2"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button3Click{
    [self.button3 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button3Clicked{
    [self.button3 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"3";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"3"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button4Click{
    [self.button4 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button4Clicked{
    [self.button4 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"4";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"4"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button5Click{
    [self.button5 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button5Clicked{
    [self.button5 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"5";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"5"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button6Click{
    [self.button6 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button6Clicked{
    [self.button6 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"6";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"6"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button7Click{
    [self.button7 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button7Clicked{
    [self.button7 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"7";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"7"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button8Click{
    [self.button8 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button8Clicked{
    [self.button8 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"8";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"8"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}
-(void)button9Click{
    [self.button9 setBackgroundColor:[UIColor colorWithRed: 0.46 green: 0.47 blue: 0.49 alpha: 1.00]];
}
-(void)button9Clicked{
    [self.button9 setBackgroundColor:[UIColor colorWithRed: 0.22 green: 0.27 blue: 0.40 alpha: 1.00]];
    if(self.shouldClean==YES){
        self.resultText.text=@"0";
        self.shouldClean=NO;
    }
    if([self.resultText.text isEqualToString:@"0"]){
        self.resultText.text=@"9";
    }else{
        NSMutableString *mStr=[NSMutableString stringWithString:self.resultText.text];
        [mStr appendString:@"9"];
        self.resultText.text=[NSString stringWithString:mStr];
    }
}

@end
