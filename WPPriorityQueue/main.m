//
//  main.m
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/14.
//

#import <Foundation/Foundation.h>
#import "WPPriorityQueue.h"
#import "Persion.h"
int main(int argc, const char * argv[]) {
    Persion *p1 = [[Persion alloc] initWithName:@"贾母" age:70];
    Persion *p2 = [[Persion alloc] initWithName:@"宝玉" age:16];
    Persion *p3 = [[Persion alloc] initWithName:@"黛玉" age:15];
    Persion *p4 = [[Persion alloc] initWithName:@"宝钗" age:17];
    Persion *p5 = [[Persion alloc] initWithName:@"妙玉" age:18];
    Persion *p6 = [[Persion alloc] initWithName:@"贾政" age:40];
    Persion *p7 = [[Persion alloc] initWithName:@"凤姐儿" age:20];
    Persion *p8 = [[Persion alloc] initWithName:@"平儿" age:19];
    WPPriorityQueue *priorityQueue = [[WPPriorityQueue alloc] initWithCapacity:10 comparator:^NSInteger(Persion *p1, Persion *p2) {
        return p1.age - p2.age;
    }];
    [priorityQueue enQueue:p1];
    [priorityQueue enQueue:p2];
    [priorityQueue enQueue:p3];
    [priorityQueue enQueue:p4];
    [priorityQueue enQueue:p5];
    [priorityQueue enQueue:p6];
    [priorityQueue enQueue:p7];
    [priorityQueue enQueue:p8];
    while (!priorityQueue.isEmpty) {
        Persion *p = [priorityQueue deQueue];
        NSLog(@"name = %@,age = %ld",p.name,p.age);
    }
    return 0;
}
