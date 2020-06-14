//
//  Item.m
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "Item.h"

@implementation Item

-(id)initWithTitle:(NSString *)title withPrice:(NSNumber *)price {
    self = [super init];
    if (self) {
        _title = title;
        _price = price;
    }
    return self;
}

@end
