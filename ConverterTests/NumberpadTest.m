#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Numberpad.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

@interface NumberpadTest : XCTestCase

@end

@implementation NumberpadTest

- (void)setUp {
}

- (id)buttonWithTag:(NSInteger)tag {
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    return button;
}

- (void)testZahlDesButtonsErscheintImDisplay {
    Numberpad *numberpad = [[Numberpad alloc] init];
    [numberpad buttonTouched:[self buttonWithTag:1]];
    assertThat(numberpad.currentValue, is(@"1"));
}

@end
