#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

@interface ConverterController (Testing)
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
- (IBAction)buttonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest {
    ConverterController *controller;
    UILabel *displayLabel;
}

- (void)setUp {
    controller = [[ConverterController alloc] init];
    displayLabel = [[UILabel alloc] init];
    controller.displayLabel = displayLabel;
}

- (UIButton *)buttonWithTag:(NSInteger)tag {
    UIButton *button = [[UIButton alloc] init];
    button.tag = 1;
    return button;
}

- (void)testZahlDesButtonsErscheintImDisplay {
    [controller buttonTouched:[self buttonWithTag:1]];
    assertThat(displayLabel.text, is(@"1"));
}

@end
