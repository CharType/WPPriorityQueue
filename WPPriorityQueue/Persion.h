//
//  Persion.h
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/15.
//

#import <Foundation/Foundation.h>


@interface Persion : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age;
@end
