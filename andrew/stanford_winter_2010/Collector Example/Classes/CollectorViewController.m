#import "CollectorViewController.h"

@implementation CollectorViewController

@synthesize totalNumberCountLabel;
@synthesize totalStringCountLabel;
@synthesize capitalizedStringsCountLabel;
@synthesize uniqueStringsCountLabel;
@synthesize uniqueNumbersCountLabel;

// Create our Collector model and set it's allowed number range to 3-57.
// We're doing this in viewDidLoad instead of lazily creating it in a private property.
// We'll talk about viewDidLoad in Lecture 5.

- (void)viewDidLoad
{
	model = [[Collector alloc] init];
	model.minimumAllowedNumber = 3;
	model.maximumAllowedNumber = 57;
}

// Set all our outlet label's texts to the appropriate statistic in our Collector model.

- (void)updateUI
{
	self.totalNumberCountLabel.text = [NSString stringWithFormat:@"%d", model.totalNumberCount];
	self.totalStringCountLabel.text = [NSString stringWithFormat:@"%d", model.totalStringCount];
	self.capitalizedStringsCountLabel.text = [NSString stringWithFormat:@"%d", model.capitalizedStringCount];
	self.uniqueStringsCountLabel.text = [NSString stringWithFormat:@"%d", model.strings.count];
	self.uniqueNumbersCountLabel.text = [NSString stringWithFormat:@"%d", model.numbers.count];
}

// Get the sender's title and pass it on to the Collector.
// Converts titles with non-zero doubleValue to NSNumber along the way.

- (void)collect:(UIButton *)sender
{
	NSString *title = sender.titleLabel.text;
	
	double numericValue = [title doubleValue];
	if (numericValue) {
		[model collect:[NSNumber numberWithDouble:numericValue]];
	} else {
		[model collect:title];
	}
	
	[self updateUI];
}

// Set all of our outlets to nil.
// Since these properties are all (retain), this will release them first.
// We'll talk about memory management of IBOutlets in Lecture 5.

- (void)viewDidUnload
{
	self.totalNumberCountLabel = nil;
	self.totalStringCountLabel = nil;
	self.capitalizedStringsCountLabel = nil;
	self.uniqueNumbersCountLabel = nil;
	self.uniqueStringsCountLabel = nil;
}

// Release our model.

- (void)dealloc
{
	[model release];
    [super dealloc];
}

@end
