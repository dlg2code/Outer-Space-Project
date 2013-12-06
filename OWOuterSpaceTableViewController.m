//
//  OWOuterSpaceTableViewController.m
//  OutofThisWorld
//
//  Created by Diana Gehring on 11/21/13.
//  Copyright (c) 2013 Diana Gehring. All rights reserved.
//

#import "OWOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObject.h"

@interface OWOuterSpaceTableViewController ()

@end

@implementation OWOuterSpaceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.planets = [[NSMutableArray alloc]init];
//    
//   NSString *planet1 = @"Mercury";
//   NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//  NSString *planet4 = @"Mars";
//  NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//  NSString *planet7 = @"Uranus";
//   NSString *planet8 = @"Neptune";
    
    self.planets = [[NSMutableArray alloc]init];
                    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
                    
    {
        
    // parse the name of the image from the planetData dictionary
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData [PLANET_NAME]];
//        
//        NSString *imageName = [NSString stringWithFormat:@”%@.jpg”, planetData[[PLANET_NAME ]];
        
        // initialize OWSpaceObject with planet data and image using our custom initializer
        
        OWSpaceObject *planet = [[OWSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed: imageName]];
        
        // add new object to our array
        
        [self.planets addObject:planet];
    }
                    
//   initWithObjects:planet1, planet2, planet3, planet4, planet5, planet6, planet7, planet8, nil];
    
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
//    [self.planets addObject:planet5];
//    [self.planets addObject:planet6];
//    [self.planets addObject:planet7];
//    [self.planets addObject:planet8];
    
    
NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc]init];
  NSString *firstColor =@"red";
   [myDictionary setObject:firstColor forKey:@"firetruck color"];
  [myDictionary setObject:@"blue" forKey:@"ocean color"];
   [myDictionary setObject:@"yellow" forKey:@"star color"];
    
   NSString *blueString = [myDictionary objectForKey:@"ocean color"];
    NSLog(@"%@",blueString);
    
    
    NSNumber *myNumber = [NSNumber numberWithInt:5];
    NSLog(@"%@", myNumber);
    NSNumber *floatNumber = [NSNumber numberWithFloat:3.14];
    NSLog(@"%@", floatNumber);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.planets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // retrieve the OWSpaceObject from our array. The video uses objectAtIndex, but we’ll use the literal syntax discussed previously.
        
    OWSpaceObject *planet = self.planets[indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    NSLog(@"%@nickname",planet.nickname);
    
    cell.imageView.image = planet.spaceImage;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
        // other properties are set. shown in video.
        
//    
//    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
//    {
//    if (indexPath.section == 0){
//        cell.backgroundColor = [UIColor redColor];
//    }
//    else {
//        cell.backgroundColor = [UIColor blueColor];
//    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */




@end
