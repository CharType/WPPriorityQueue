//
//  WPPriorityQueue.h
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/14.
//  优先级队列

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPPriorityQueue<__covariant ObjectType> : NSObject
- (instancetype)initWithCapacity:(NSInteger)capacity cmptr:(NSComparator)cmptr;
- (instancetype)initWithArray:(NSArray<ObjectType> *)array cmptr:(NSComparator)cmptr;
- (BOOL)isEmpty;
- (NSInteger)count;
@end

NS_ASSUME_NONNULL_END
