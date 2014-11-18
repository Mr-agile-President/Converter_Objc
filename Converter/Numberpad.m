#import "Numberpad.h"

@implementation Numberpad

-(void)buttonTouched:(id)sender {
    _currentValue = [NSString stringWithFormat:@"%ld", (long)[sender tag]];
}

@end
