//
//  WPPriorityQueue.h
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/14.
//  优先级队列

#import <Foundation/Foundation.h>
typedef NSInteger (^WPPriorityQueueComparator)(id obj1, id obj2);

@interface WPPriorityQueue<ObjectType> : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithCapacity:(NSInteger)capacity comparator:(WPPriorityQueueComparator)comparator;
- (instancetype)initWithArray:(NSArray<ObjectType> *)array comparator:(WPPriorityQueueComparator)comparator;
- (void)clear;
- (void)enQueue:(ObjectType)element;
- (ObjectType)deQueue;
- (void)removeElement:(ObjectType)element;
- (ObjectType)front;
- (BOOL)isEmpty;
- (NSInteger)size;
@end
