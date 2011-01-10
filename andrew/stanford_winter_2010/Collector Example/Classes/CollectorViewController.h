#import <UIKit/UIKit.h>
#import "Collector.h"

@interface CollectorViewController : UIViewController
{
	IBOutlet UILabel *totalStringCountLabel;
	IBOutlet UILabel *totalNumberCountLabel;
	IBOutlet UILabel *capitalizedStringsCountLabel;
	IBOutlet UILabel *uniqueStringsCountLabel;
	IBOutlet UILabel *uniqueNumbersCountLabel;
	Collector *model;
}

// Outlets for reporting Collector statistics.
// We'll talk about why we create these properties in Lecture 5.

@property (nonatomic, retain) IBOutlet UILabel *totalStringCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalNumberCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *capitalizedStringsCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *uniqueStringsCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *uniqueNumbersCountLabel;

// Asks the sender for its title.
// If the title's doubleValue is non-zero, converts the title to an NSNumber.
// Sends the title to a Collector as an NSString or NSNumber.
// Collector's statistics are updated in the UI through the above outlets.

- (IBAction)collect:(UIButton *)sender;

@end
