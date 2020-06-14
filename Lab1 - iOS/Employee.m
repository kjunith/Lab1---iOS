//
//  Employee.m
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "Employee.h"

@implementation Employee

-(id)initWithCost:(NSNumber *)cost {
    self = [self init];
    if (self) {
        _cost = cost;
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)employeeData {
    self = [self init];
    if (self) {
        _cost = employeeData[@"cost"];
    }
    
    return self;
}

- (NSDictionary *)dictionaryFromItemShop {
    return @{@"cost":_cost};
}

@end
