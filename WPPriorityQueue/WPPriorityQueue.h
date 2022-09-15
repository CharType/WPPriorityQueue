//
//  WPPriorityQueue.h
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/14.
//  优先级队列

#import <Foundation/Foundation.h>
typedef NSInteger (^WPPriorityQueueComparator)(id obj1, id obj2);

@interface WPPriorityQueue<__covariant ObjectType> : NSObject
- (instancetype)initWithCapacity:(NSInteger)capacity comparator:(WPPriorityQueueComparator)comparator;
- (instancetype)initWithArray:(NSArray<ObjectType> *)array comparator:(WPPriorityQueueComparator)comparator;
- (void)clear;
- (void)enQueue:(id)element;
- (id)deQueue;
- (void)removeElement:(id)element;
- (id)front;
- (BOOL)isEmpty;
- (NSInteger)count;
@end
