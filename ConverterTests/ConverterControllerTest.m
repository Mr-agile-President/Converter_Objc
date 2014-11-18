#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"
#import "Numberpad.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

@interface ConverterController (Testing)
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
- (IBAction)buttonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest {
    ConverterController *controller;
    id displayLabel;
    id numberpad;
}

- (void)setUp {
    controller = [[ConverterController alloc] init];
    displayLabel = mock([UILabel class]);
    controller.displayLabel = displayLabel;
    numberpad = mock([Numberpad class]);
    controller.numberpad = numberpad;
}

- (id)buttonWithTag:(NSInteger)tag {
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    return button;
}

- (void)testControllerHatNumberpad {
    [controller viewDidLoad];
    assertThat(controller.numberpad, is(notNilValue()));
}

- (void)testButtonTouchesWerdenAnNumberpadWeitergeleitet {
    id button = [self buttonWithTag:2];
    [controller buttonTouched:button];
    [verify(numberpad) buttonTouched:button];
}

- (void)testZeigtAktuellenWertImDisplayAn {
    [given([numberpad currentValue]) willReturn:@"42"];
    [controller buttonTouched:nil];
    [verify(displayLabel) setText:@"42"];
}
@end
