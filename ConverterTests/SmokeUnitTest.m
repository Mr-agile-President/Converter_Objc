#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

@interface SmokeUnitTest : XCTestCase

@end

@implementation SmokeUnitTest

- (void)testItShouldSmoke {
    // arrange
    NSString *foo = @"foo";
    NSString *bar = @"bar";
    NSString *foobar = @"foobar";

    // act
    NSArray *array = @[foo, bar];
    
    // assert
    assertThat(array, hasItem(foo));
    assertThat(foo, is(@"foo"));

    NSInteger vier = 4;
    assertThatInteger(vier, equalToInteger(4));
}
@end
