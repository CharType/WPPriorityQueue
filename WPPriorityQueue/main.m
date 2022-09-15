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
    {
        Persion *p1 = [[Persion alloc] initWithName:@"贾母" age:70];
        Persion *p2 = [[Persion alloc] initWithName:@"宝玉" age:16];
        Persion *p3 = [[Persion alloc] initWithName:@"黛玉" age:15];
        Persion *p4 = [[Persion alloc] initWithName:@"宝钗" age:17];
        Persion *p5 = [[Persion alloc] initWithName:@"妙玉" age:18];
        Persion *p6 = [[Persion alloc] initWithName:@"贾政" age:40];
        Persion *p7 = [[Persion alloc] initWithName:@"凤姐儿" age:20];
        Persion *p8 = [[Persion alloc] initWithName:@"平儿" age:19];
        Persion *p9 = [[Persion alloc] initWithName:@"巧姐" age:3];
        Persion *p10 = [[Persion alloc] initWithName:@"元春" age:20];
        Persion *p11 = [[Persion alloc] initWithName:@"袭人" age:13];
        Persion *p12 = [[Persion alloc] initWithName:@"晴雯" age:16];
        WPPriorityQueue<Persion *> *priorityQueue = [[WPPriorityQueue alloc] initWithCapacity:10 comparator:^NSInteger(Persion *p1, Persion *p2) {
            return p1.age - p2.age;
        }];
        [priorityQueue enQueue:p1];
        assert(priorityQueue.size == 1);
        [priorityQueue enQueue:p2];
        assert(priorityQueue.size == 2);
        [priorityQueue enQueue:p3];
        assert(priorityQueue.size == 3);
        [priorityQueue enQueue:p4];
        assert(priorityQueue.size == 4);
        [priorityQueue enQueue:p5];
        assert(priorityQueue.size == 5);
        [priorityQueue removeElement:p5];
        assert(priorityQueue.size == 4);
        [priorityQueue enQueue:p6];
        assert(priorityQueue.size == 5);
        [priorityQueue enQueue:p7];
        assert(priorityQueue.size == 6);
        [priorityQueue enQueue:p8];
        assert(priorityQueue.size == 7);
        assert(!priorityQueue.isEmpty);
        [priorityQueue enQueue:p9];
        [priorityQueue enQueue:p10];
        [priorityQueue enQueue:p11];
        [priorityQueue enQueue:p12];
        assert(priorityQueue.size == 11);
//        Persion *p = [priorityQueue front];
//        [priorityQueue removeElement:p5];
//        [priorityQueue clear];
//        assert(priorityQueue.size == 0);
//        assert(priorityQueue.isEmpty);
        while (!priorityQueue.isEmpty) {
            Persion *p = [priorityQueue deQueue];
            NSLog(@"name = %@,age = %ld",p.name,p.age);
        }
    }
    
    
    return 0;
}
