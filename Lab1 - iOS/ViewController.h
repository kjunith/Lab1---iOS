//
//  ViewController.h
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemShop.h"
#import "Manager.h"

@interface ViewController : UIViewController {
    NSString *itemShopKey;
    NSString *managersKey;
    NSString *emplyeesKey;
}

@property (strong) ItemShop *itemShop;
@property (strong) NSMutableArray *managers;
@property (strong) NSMutableArray *employees;
@property (strong) NSMutableArray *items;

// Views
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UIView *viewShopInfo;
@property (weak, nonatomic) IBOutlet UIView *viewSales;
@property (weak, nonatomic) IBOutlet UIView *viewChangeName;

// Change ItemShop Name
@property (weak, nonatomic) IBOutlet UILabel *labelItemShopName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChangeName;
@property (weak, nonatomic) IBOutlet UIButton *buttonChangeName;

- (IBAction)changeShopNamePressed:(id)sender;

// Managers
@property (weak, nonatomic) IBOutlet UILabel *labelManagers;
@property (weak, nonatomic) IBOutlet UIButton *buttonHireManager;
- (IBAction)hireManagerButtonPressed:(id)sender;

// Employees
@property (weak, nonatomic) IBOutlet UILabel *labelEmployees;
@property (weak, nonatomic) IBOutlet UIButton *buttonHireEmployee;
- (IBAction)hireEmployeeButtonPressed:(id)sender;

// Sales
@property (weak, nonatomic) IBOutlet UILabel *labelSales;
@property (weak, nonatomic) IBOutlet UITextView *textViewSales;

@end

