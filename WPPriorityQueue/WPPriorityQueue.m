//
//  WPPriorityQueue.m
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/14.
//

#import "WPPriorityQueue.h"

static const NSInteger DEFAULT_CAPACITY = 10;

@interface WPPriorityQueue()
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSComparator cmptr;
@end

@implementation WPPriorityQueue
{
    // 存放数据的数组
    void **elements;
}

- (void)dealloc {
    
}

- (instancetype)initWithCapacity:(NSInteger)capacity cmptr:(NSComparator)cmptr {
    if (self = [super init]) {
        self.cmptr = cmptr;
        capacity = MAX(capacity, DEFAULT_CAPACITY);
        elements = malloc(capacity * sizeof(void *));
    }
    return self;
}

- (instancetype)initWithArray:(NSArray<id> *)array cmptr:(NSComparator)cmptr {
    NSInteger capacity = MAX(array.count, DEFAULT_CAPACITY);
    if(self = [self initWithCapacity:capacity cmptr:cmptr]) {
        for (NSInteger i = 0; i < array.count; i++) {
            elements[i] = (__bridge void *)(array[i]);
        }
    }
    return self;
}

- (void)heapify {
    
}

- (void)siftDownForIndex:(NSInteger)index {
    
}

- (void)siftUpForIndex:(NSInteger)index {
    
}

- (BOOL)isEmpty {
    return self.count == 0;
}

- (NSInteger)compareObj1:(id)obj1 obj2:(id)obj2 {
    if (self.cmptr) {
        return self.cmptr(obj1,obj2);
    }
    //TODO: 这里看要怎么去实现
    return 0;
}

@end
