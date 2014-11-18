#import "ConverterController.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;

@end

@implementation ConverterController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
    self.numberpad = [[Numberpad alloc] init];
}

- (IBAction)buttonTouched:(id)sender {
    [self.numberpad buttonTouched:sender];
    self.displayLabel.text = self.numberpad.currentValue;
}


@end
