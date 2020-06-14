//
//  Employee.h
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject

@property (strong) NSNumber *cost;

-(id)initWithCost:(NSNumber *)cost;
-(id)initWithDictionary:(NSDictionary *)employeeData;
- (NSDictionary *)dictionaryFromEmployee;

@end

NS_ASSUME_NONNULL_END
