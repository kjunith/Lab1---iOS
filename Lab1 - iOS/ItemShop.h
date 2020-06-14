//
//  Item Shop.h
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemShop : NSObject

@property (strong) NSString *itemShopName;
@property (strong) NSNumber *totalSales;

@property (strong) NSMutableArray *managers;
@property (strong) NSNumber *managerCost;

@property (strong) NSMutableArray *employees;
@property (strong) NSNumber *employeeCost;

-(id)initWithDictionary:(NSDictionary *)shopData;
- (NSDictionary *)dictionaryFromItemShop;

@end

NS_ASSUME_NONNULL_END
