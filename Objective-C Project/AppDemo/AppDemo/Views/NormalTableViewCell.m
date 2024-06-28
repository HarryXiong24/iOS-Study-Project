//
//  NormalTableViewCell.m
//  AppDemo
//

#import "NormalTableViewCell.h"

@interface NormalTableViewCell ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;

@property (nonatomic, strong, readwrite) UIImageView *rightImageView;
@property (nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation NormalTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

	if (self) {
		[self.contentView addSubview:({
			self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
			self.titleLabel.font = [UIFont systemFontOfSize:16];
			self.titleLabel.textColor = [UIColor blackColor];
			self.titleLabel.numberOfLines = 2;
			self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
			self.titleLabel;
		})];

		[self.contentView addSubview:({
			self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
			self.sourceLabel.font = [UIFont systemFontOfSize:12];
			self.sourceLabel.textColor = [UIColor grayColor];
			self.sourceLabel;
		})];

		[self.contentView addSubview:({
			self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
			self.commentLabel.font = [UIFont systemFontOfSize:12];
			self.commentLabel.textColor = [UIColor grayColor];
			self.commentLabel;
		})];

		[self.contentView addSubview:({
			self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
			self.timeLabel.font = [UIFont systemFontOfSize:12];
			self.timeLabel.textColor = [UIColor grayColor];
			self.timeLabel;
		})];

		[self.contentView addSubview:({
			self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
			self.rightImageView;
		})];

		[self.contentView addSubview:({
			self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 80, 30, 20)];
			self.deleteButton.backgroundColor = [UIColor greenColor];
			[self.deleteButton setTitle:@"X"
			 forState:UIControlStateNormal];
			[self.deleteButton setTitle:@"V"
			 forState:UIControlStateHighlighted];


			[self.deleteButton addTarget:self
			 action:@selector(toggleButtonSelected)
			 forControlEvents:UIControlEventTouchUpInside];

			self.deleteButton.layer.cornerRadius = 10;
			self.deleteButton.layer.masksToBounds = YES;
			self.deleteButton.layer.borderWidth = 2;
			self.deleteButton.layer.borderColor = [UIColor grayColor].CGColor;

			self.deleteButton;
		})];
	}

	return self;
}

- (void)toggleButtonSelected {
	[self.deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
	self.deleteButton.selected = !self.deleteButton.selected;
}

- (void)layoutTableViewCell {
	self.titleLabel.text = @"Title";

	self.sourceLabel.text = @"the US";
	[self.sourceLabel sizeToFit];

	self.commentLabel.text = @"Good!";
	[self.commentLabel sizeToFit];

	self.timeLabel.text = @"6/26/2024";
	[self.timeLabel sizeToFit];

	self.rightImageView.image = [UIImage imageNamed:@"videoCover"];
}

- (void)awakeFromNib {
	[super awakeFromNib];
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}

- (void)deleteButtonClick {
	if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
		[self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
	}
}

@end
