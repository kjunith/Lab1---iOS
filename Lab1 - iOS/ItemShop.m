//
//  Item Shop.m
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "ItemShop.h"

@implementation ItemShop

-(id)initWithDictionary:(NSDictionary *)itemShopData {
    self = [self init];
    if (self) {
        _itemShopName = itemShopData[@"itemShopName"];
        _totalSales = itemShopData[@"totalSales"];
        _managerCost = itemShopData[@"managerCost"];
        _employeeCost = itemShopData[@"employeesCost"];
    }
    
    return self;
}

- (NSDictionary *)dictionaryFromItemShop {
    return @{@"itemShopName":_itemShopName,
             @"totalSales":_totalSales,
             @"managerCost":_managerCost,
             @"employeeCost":_employeeCost};
}

@end
