//
//  Persion.m
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/15.
//

#import "Persion.h"


@implementation Persion

- (void)dealloc {
    NSLog(@"数据delloc name = %@ age = %ld",self.name,self.age);
}

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age {
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}
@end
