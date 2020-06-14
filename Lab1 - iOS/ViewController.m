//
//  ViewController.m
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
#import "Manager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewControllerBackground];
    
    _items = [NSMutableArray new];
    [self createItemsAndAddToItemList];
    
    itemShopKey = @"itemShop";
    managersKey = @"managers";
    emplyeesKey = @"employees";
    
    NSDictionary *savedItemShop = [[NSUserDefaults standardUserDefaults] objectForKey: itemShopKey];
    NSArray *savedManagers = [[NSUserDefaults standardUserDefaults] arrayForKey: managersKey];
    NSArray *savedEmployees = [[NSUserDefaults standardUserDefaults] arrayForKey: emplyeesKey];
    
    if (savedItemShop) {
        _itemShop = [[ItemShop alloc] initWithDictionary: [[NSUserDefaults standardUserDefaults] objectForKey: itemShopKey]];
        if (savedManagers) {
            _itemShop = [[ItemShop alloc] initWithDictionary:savedItemShop];
            for (NSDictionary *managerData in savedManagers) {
                Manager *manager = [[Manager alloc] initWithDictionary: managerData];
                [_itemShop.managers addObject: manager];
            }
        }
        else {
            _itemShop.managers = [NSMutableArray new];
        }
        for (NSDictionary *employeeData in savedEmployees) {
            Employee *employee = [[Employee alloc] initWithDictionary: employeeData];
            [_itemShop.employees addObject: employee];
        }
    }
    else {
        [self initNewGame];
    }
    [self initGame];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(makeSaleEverySecond)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)initGame {
    _labelSales.text = [NSString stringWithFormat:@"%@", _itemShop.totalSales];
    
    [_buttonHireEmployee setTitle:[NSString stringWithFormat: @"Hire: %@", _itemShop.employeeCost] forState:UIControlStateNormal];
    _labelEmployees.text = [NSString stringWithFormat:@"%lu", _itemShop.employees.count];
    
    [_buttonHireManager setTitle:[NSString stringWithFormat: @"Hire: %@", _itemShop.managerCost] forState:UIControlStateNormal];
    _labelManagers.text = [NSString stringWithFormat:@"%lu", _itemShop.managers.count];
    NSLog(@"%@, %@, %@, %@, %@, %@", _itemShop.itemShopName, _itemShop.totalSales, _itemShop.managers, _itemShop.managerCost, _itemShop.employees, _itemShop.employeeCost);
    NSLog(@"%@, %@", _managers, _employees);
}

-(void)initNewGame {
    _itemShop = [ItemShop new];
    _itemShop.itemShopName = _labelItemShopName.text;
    
    _itemShop.employees = [NSMutableArray new];
    _itemShop.managers = [NSMutableArray new];
    
    _itemShop.totalSales = [NSNumber numberWithInt: 0];
    
    _itemShop.employeeCost = [NSNumber numberWithInt: 1000];
    _itemShop.managerCost = [NSNumber numberWithInt: 10000];
    
    [_itemShop.employees addObject: [[Employee alloc] initWithCost: _itemShop.employeeCost]];
    NSLog(@"%@, %@, %@, %@, %@, %@", _itemShop.itemShopName, _itemShop.totalSales, _itemShop.managers, _itemShop.managerCost, _itemShop.employees, _itemShop.employeeCost);
    NSLog(@"%@, %@", _managers, _employees);
}

-(void)saveAllData {
    NSMutableArray *managers = [NSMutableArray new];
    for (Manager *manager in _itemShop.managers) {
        NSDictionary *managerData = [manager dictionaryFromManager];
        [managers addObject:managerData];
    }
    [[NSUserDefaults standardUserDefaults] setObject:managers forKey:managersKey];
    
    NSMutableArray *employees = [NSMutableArray new];
    for (Employee *employee in _itemShop.managers) {
        NSDictionary *employeeData = [employee dictionaryFromEmployee];
        [employees addObject:employeeData];
    }
    [[NSUserDefaults standardUserDefaults] setObject:employees forKey:emplyeesKey];
    
    NSDictionary *data = [_itemShop dictionaryFromItemShop];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:itemShopKey];
    NSLog(@"%@, %@, %@, %@, %@, %@", _itemShop.itemShopName, _itemShop.totalSales, _itemShop.managers, _itemShop.managerCost, _itemShop.employees, _itemShop.employeeCost);
    NSLog(@"%@, %@", _managers, _employees);
}

-(void)viewWillLayoutSubviews {
    _textViewSales.editable = NO;
    [_textViewSales setContentOffset:CGPointZero animated:YES];
    [self setBackgroundColorPaddingAndRoundedCornersOnViews];
}

- (IBAction)changeShopNamePressed:(id)sender {
    _itemShop.itemShopName = _textFieldChangeName.text;
    _textFieldChangeName.text = @"";
    [_textFieldChangeName resignFirstResponder];
    _labelItemShopName.text = _itemShop.itemShopName;
}

- (IBAction)hireManagerButtonPressed:(id)sender {
    if ([_itemShop.totalSales intValue] >= [_itemShop.managerCost intValue]) {
        [_itemShop.managers addObject: [[Manager alloc] initWithCost: _itemShop.managerCost]];
        [_managers addObject: [[Manager alloc] initWithCost: _itemShop.managerCost]];
        
        int sales = [_itemShop.totalSales intValue];
        _itemShop.totalSales = [NSNumber numberWithInt:(sales - [_itemShop.managerCost intValue])];
        
        int cost = [_itemShop.managerCost intValue] * 2;
        _itemShop.managerCost = [NSNumber numberWithInteger: cost];
    }
    
    _labelManagers.text = [NSString stringWithFormat:@"%lu", _itemShop.managers.count];
    [_buttonHireManager setTitle:[NSString stringWithFormat: @"Hire: %@", _itemShop.managerCost] forState:UIControlStateNormal];
}

- (IBAction)hireEmployeeButtonPressed:(id)sender {
    if ([_itemShop.totalSales intValue] >= [_itemShop.employeeCost intValue]) {
        [_itemShop.employees addObject: [[Employee alloc] initWithCost: _itemShop.employeeCost]];
        [_employees addObject: [[Employee alloc] initWithCost: _itemShop.employeeCost]];
        
        int sales = [_itemShop.totalSales intValue];
        _itemShop.totalSales = [NSNumber numberWithInt:(sales - [_itemShop.employeeCost intValue])];
        
        int cost = [_itemShop.employeeCost intValue] * 1.5;
        _itemShop.employeeCost = [NSNumber numberWithInt: cost];
    }
    
    _labelEmployees.text = [NSString stringWithFormat:@"%lu", _itemShop.employees.count];
    [_buttonHireEmployee setTitle:[NSString stringWithFormat: @"Hire: %@", _itemShop.employeeCost] forState:UIControlStateNormal];
}

-(void)makeSaleEverySecond {
    for (int i = 0; i < _itemShop.employees.count; i++) {
        Item *randomItem = [self getRandomItem];
        int price = [randomItem.price intValue];
        if (_itemShop.managers != nil) {
            for (int i = 0; i < _itemShop.managers.count; i++) {
                price += [randomItem.price intValue];
            }
        }
        
        NSString *soldItem = [NSString stringWithFormat:@"Sold %@ for %d\n", randomItem.title, price];
        _textViewSales.text = [soldItem stringByAppendingString: _textViewSales.text];
        
        [self updateTotalSalesWithPrice: [NSNumber numberWithInt: price]];
    }
    
    // Fantastiskt svårt att pilla med att spara all data. Att det MÅÅÅSTE va ett värde (som jag uppfattar det) och inte kan vara (null) är inte logiskt för mig. Man ska inte behöva fylla i/vänta tills allt har ett värde. Jag behöver få detta mer klart för mig.
    
    //[self saveAllData];
}

-(void)updateTotalSalesWithPrice:(NSNumber *)price {
    _itemShop.totalSales = [NSNumber numberWithInteger:([_itemShop.totalSales integerValue] + [price integerValue])];
    _labelSales.text = [NSString stringWithFormat:@"%@", _itemShop.totalSales];
}

-(Item *)getRandomItem {
    int randomItem = arc4random() % _items.count;
    return [_items objectAtIndex:randomItem];
}

-(void)createItemsAndAddToItemList {
    [_items addObject:[[Item new] initWithTitle:@"Bloodstone" withPrice: [NSNumber numberWithInt: 50]]];
    [_items addObject:[[Item new] initWithTitle:@"Topaz" withPrice: [NSNumber numberWithInt: 45]]];
    [_items addObject:[[Item new] initWithTitle:@"Watch" withPrice: [NSNumber numberWithInt: 40]]];
    [_items addObject:[[Item new] initWithTitle:@"Tent" withPrice: [NSNumber numberWithInt: 35]]];
    [_items addObject:[[Item new] initWithTitle:@"Hammer" withPrice: [NSNumber numberWithInt: 30]]];
    [_items addObject:[[Item new] initWithTitle:@"Beef" withPrice: [NSNumber numberWithInt: 25]]];
    [_items addObject:[[Item new] initWithTitle:@"Rice" withPrice: [NSNumber numberWithInt: 20]]];
    [_items addObject:[[Item new] initWithTitle:@"Broccoli" withPrice: [NSNumber numberWithInt: 15]]];
    [_items addObject:[[Item new] initWithTitle:@"Milk" withPrice: [NSNumber numberWithInt: 10]]];
    [_items addObject:[[Item new] initWithTitle:@"Peanut" withPrice: [NSNumber numberWithInt: 5]]];
}

-(void)setViewControllerBackground {
    self.view.backgroundColor = [UIColor colorWithRed: 255/255.0 green:100/255.0 blue:75/255.0 alpha:1.0];
}

-(void)setBackgroundColorPaddingAndRoundedCornersOnViews {
    NSMutableArray *viewArray = [NSMutableArray new];
    [viewArray addObject: _viewHeader];
    [viewArray addObject: _viewChangeName];
    [viewArray addObject: _viewShopInfo];
    [viewArray addObject: _viewSales];
    for (UIView *view in viewArray) {
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 8;
        view.layer.masksToBounds = true;
    }
}

@end
