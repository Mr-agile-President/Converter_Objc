#import <UIKit/UIKit.h>

@interface Numberpad : NSObject

@property(nonatomic, readonly) NSString *currentValue;

- (void)buttonTouched:(id)sender;

@end
