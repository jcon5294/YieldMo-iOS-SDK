//
//  SecondViewController.m
//  SampleApp
//
//  Created by Alexander Gallego on 11/25/13.
//
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic) NSArray *views;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation SecondViewController
@synthesize views = _views;

-(NSArray*) placements {
  if(!_views) _views = [[NSArray alloc] init];
  return _views;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.clipsToBounds=NO;
  [self.tableview setDataSource:self];
  [self.tableview setDelegate:self];
  self.tableview.allowsSelection = NO;
  //Replace YOUR_PLACEMENT_ID with the unprefixed portion of the YieldMo placement ID
  [[YM sharedYM] fetchPlacements: [[NSArray alloc] initWithObjects:@"YOUR_PLACEMENT_ID_HERE", nil]
           withCompletionHandler: ^(NSArray *ymPlacements, NSError *error) {
             
             self.views = [ymPlacements valueForKeyPath:@"view"];
             for(YMPlacement *pl in ymPlacements) [pl setDelegate:self];
             [self.tableview reloadData];
             
           }];
  
}

-(void) placement:(YMPlacement *)yieldmoPlacement changedDimensions:(CGSize)dimensions{
  [self.tableview reloadData];
  
  NSLog(@"placementID: %@,  bounds:%@, frame:%@, bounds_origin:%@, frame_origin:%@"
          , yieldmoPlacement.placementId
          , NSStringFromCGSize(yieldmoPlacement.view.bounds.size)
          , NSStringFromCGSize(yieldmoPlacement.view.frame.size)
          , NSStringFromCGPoint(yieldmoPlacement.view.bounds.origin)
          , NSStringFromCGPoint(yieldmoPlacement.view.frame.origin));
}
//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  if((int)indexPath.row < self.views.count){
    UIView *tempView = [self.views objectAtIndex:indexPath.row];
    return tempView.bounds.size.height;
  }
  return 72;

}

#pragma mark UITableView protocol methods
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

  [cell setAccessoryType:UITableViewCellAccessoryNone];
  cell.textLabel.text = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];

  if (indexPath.row < self.views.count) {
    [cell.contentView addSubview:self.views[indexPath.row]];
    [cell.contentView layoutSubviews];
  }
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 4;
}


@end
