//
//  Manager.m
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "Manager.h"

@implementation Manager

-(id)initWithCost:(NSNumber *)cost {
    self = [self init];
    if (self) {
        self.cost = cost;
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)managerData {
    self = [self init];
    if (self) {
        self.cost = managerData[@"cost"];
    }
    
    return self;
}

- (NSDictionary *)dictionaryFromManager {
    return @{@"cost":self.cost};
}


@end
