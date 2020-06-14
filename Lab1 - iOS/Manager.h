//
//  Manager.h
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Manager : Employee

-(id)initWithCost:(NSNumber *)cost;
-(id)initWithDictionary:(NSDictionary *)managerData;
- (NSDictionary *)dictionaryFromManager;

@end

NS_ASSUME_NONNULL_END
