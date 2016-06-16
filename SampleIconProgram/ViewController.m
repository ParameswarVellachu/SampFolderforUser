//
//  ViewController.m
//  SampleIconProgram
//
//  Created by MTCHNDT on 31/05/16.
//  Copyright © 2016 Params. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)btnDwonload:(id)sender
{
    NSError *error;
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=[paths objectAtIndex:0];
    NSString *dataPath = [documentDirectory stringByAppendingPathComponent:txtName.text];
//    NSString *strUrl =@"http://www.tutorialspoint.com/swift/swift_tutorial.pdf";
//    NSString *strUrl =@"http://www.tutorialspoint.com/ios/ios_tutorial.pdf";
//    NSString *strUrl =@"https://arxiv.org/pdf/0907.4960.pdf";
    NSString *strUrl =@"http://www.arshavidyacenter.org/new/children/betal.pdf";
    NSString *strIssueName = [strUrl lastPathComponent];
    
    NSData *datapdf = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:strUrl]];
//    NSLog(@"finalpath--%@",finalPath);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    }
    
     //check your path correctly and provide your name dynamically
    dataPath = [dataPath stringByAppendingPathComponent:[NSString stringWithFormat: @"%@",strIssueName]];
    

    if(datapdf)
        [datapdf writeToFile:dataPath atomically:YES];
    
}

-(IBAction)btn:(id)sender
{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dataPath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",txtName.text]];
//    NSString *fileName = [NSString stringWithFormat:@"File%ld.txt",(long)indexPath.row];
    NSString *fileName = txtPdfName.text;
    NSString *folderPath = [dataPath stringByAppendingPathComponent:fileName];
//    NSString *myFile = [[NSString alloc]initWithContentsOfFile:folderPath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *directoryContent  = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    int numberOfFileInFolder = [directoryContent count];
    NSLog(@"Count:%d",numberOfFileInFolder);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
