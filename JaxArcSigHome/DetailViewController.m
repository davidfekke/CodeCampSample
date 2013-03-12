//
//  DetailViewController.m
//  JaxArcSigHome
//
//  Created by David Fekke on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize age = _age;
@synthesize phone = _phone;
@synthesize city = _city;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        NSString *urlStr = [NSString stringWithFormat:@"http://172.20.10.6/CodeCampAPI/api/person/%@", [self.detailItem description]];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSError *err;
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        self.firstName.text = [dict objectForKey:@"FirstName"];
        self.lastName.text = [dict objectForKey:@"LastName"];
        self.age.text = [[dict objectForKey:@"Age"] description];
        self.phone.text = [dict objectForKey:@"phone"];
        self.city.text = [dict objectForKey:@"City"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setFirstName:nil];
    [self setLastName:nil];
    [self setAge:nil];
    [self setPhone:nil];
    [self setCity:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
