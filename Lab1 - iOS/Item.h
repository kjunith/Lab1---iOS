//
//  Item.h
//  Lab1 - iOS
//
//  Created by JImmie Määttä on 2019-01-26.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property (strong) NSString *title;
@property (strong) NSNumber *price;

-(id)initWithTitle:(NSString *)title withPrice:(NSNumber *)price;

@end

NS_ASSUME_NONNULL_END
