//
//  WPPriorityQueue.m
//  WPPriorityQueue
//
//  Created by 程倩 on 2022/9/14.
//

#import "WPPriorityQueue.h"

static const NSInteger DEFAULT_CAPACITY = 10;

/**
 OC版本优先级队列
 */
@interface WPPriorityQueue()
// 记录数组存放的数据数量
@property (nonatomic, assign) NSInteger count;
// 比较Block
@property (nonatomic, copy) WPPriorityQueueComparator comparator;
@end

@implementation WPPriorityQueue
{
    // 存放数据的数组
    void **elements;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
    [self clear];
    if (elements) {
        free(elements);
    }
}

- (instancetype)initWithCapacity:(NSInteger)capacity comparator:(WPPriorityQueueComparator)comparator {
    if (self = [super init]) {
        self.comparator = comparator;
        capacity = MAX(capacity, DEFAULT_CAPACITY);
        elements = malloc(capacity * sizeof(void *));
    }
    return self;
}

- (instancetype)initWithArray:(NSArray<id> *)array comparator:(WPPriorityQueueComparator)comparator {
    NSInteger capacity = MAX(array.count, DEFAULT_CAPACITY);
    if(self = [self initWithCapacity:capacity comparator:comparator]) {
        for (NSInteger i = 0; i < array.count; i++) {
            elements[i] = (__bridge void *)(array[i]);
        }
        [self heapify];
    }
    return self;
}

-(void)clear {
    for (NSInteger i = 0; i < self.count; i++) {
        elements[i] = NULL;
    }
    self.count = 0;
}

- (void)enQueue:(id)element {
    [self addElement:element];
}

- (id)deQueue {
    return [self remove];
}

- (id)front {
    return [self get];
}

- (NSInteger)size {
    return self.count;
}

- (void)addElement:(id)element {
    [self elementNotNullCheckForObj:element];
    [self ensureCapacity:self.count + 1];
    elements[self.count++] = (__bridge void *)(element);
    [self siftUpForIndex:self.count - 1];
}

-(id)get {
    [self emptyCheck];
    return (__bridge_transfer id)(elements[0]);
}

- (id)remove {
    [self emptyCheck];

    NSInteger lastIndex = self.count - 1;
    id root = (__bridge_transfer id)(elements[0]);
    elements[0] = elements[lastIndex];
    elements[lastIndex] = NULL;
    self.count--;
    [self siftDownForIndex:0];
    return root;
}

- (void)removeElement:(id)element {
    // 在数组中查找对应的元素，
    NSInteger index = -1;
    for (NSInteger i = 0;i < self.count;i++) {
        id value = (__bridge id)(elements[i]);
        if(value == element) {
            elements[i] = NULL;
            index = i;
            break;
        }
    }
    if(index != -1) {
        // 挪动后面的数据
        NSInteger lastIndex = --self.count;
        elements[index] = elements[lastIndex];
        elements[lastIndex] = NULL;
        [self siftDownForIndex:index];
    }
}

- (id)replace:(id)element {
    [self elementNotNullCheckForObj:element];
    id root = NULL;
    if (self.count == 0) {
        elements[0] = (__bridge void *)(element);
        self.count++;
    } else {
        root = (__bridge_transfer id)(elements[0]);
        elements[0] = (__bridge void *)(element);
        [self siftDownForIndex:0];
    }
    return root;
}

- (void)heapify {
    for (NSInteger i = (self.count >> 1) - 1; i >= 0; i--) {
        [self siftDownForIndex:i];
    }
}

- (void)siftDownForIndex:(NSInteger)index {
    id element = (__bridge id)(elements[index]);
    NSInteger half = self.count >> 1;
    // 第一个叶子节点的索引 == 非叶子节点的数量
    // index < 第一个叶子节点的索引
    // 必须保证index位置是非叶子节点
    while (index < half) {
        // index的节点有2种情况
        // 1.只有左子节点
        // 2.同时有左右子节点
        // 默认为左子节点跟它进行比较
        NSInteger childIndex = (index << 1) + 1;
        id child = (__bridge id)(elements[childIndex]);
            
        // 右子节点
        NSInteger rightIndex = childIndex + 1;
        
        // 选出左右子节点最大的那个
        if (rightIndex < self.count &&
            self.comparator((__bridge id)(elements[rightIndex]),child)> 0) {
            child = (__bridge id)(elements[childIndex = rightIndex]);
        }
        
        if (self.comparator(element,child) >= 0) break;

        // 将子节点存放到index位置
        elements[index] = (__bridge void *)(child);
        // 重新设置index
        index = childIndex;
    }
    elements[index] = (__bridge void *)(element);
}

- (void)siftUpForIndex:(NSInteger)index {
    id element = (__bridge id)(elements[index]);
    while (index > 0) {
        NSInteger parentIndex = (index - 1) >> 1;
        id parent = (__bridge id)(elements[parentIndex]);
        if (self.comparator(element, parent) <= 0) break;
            // 将父元素存储在index位置
            elements[index] = (__bridge void *)(parent);
            // 重新赋值index
            index = parentIndex;
    }
    elements[index] = (__bridge void *)(element);
}

- (void)ensureCapacity:(NSInteger)capacity {
    NSInteger oldCapacity = self.count;
    if (oldCapacity >= capacity) return;
    
    NSInteger newCapacity = oldCapacity + (oldCapacity >> 1);
    void **newElements = malloc(newCapacity * sizeof(void *));
    for (int i = 0; i < self.count; i++) {
        newElements[i] = elements[i];
    }
    elements = newElements;
}
    
- (void)emptyCheck {
    if (self.count == 0) {
        //TODO:这里还是要抛异常
//        @throw [NSException exceptionWithName:@"异常名称" reason:@"异常原因" userInfo:nil]
        NSLog(@"Heap is empty");
    }
}

-(void)elementNotNullCheckForObj:(id)element {
    if (!element) {
        //TODO:这里还是要抛异常
//        @throw [NSException exceptionWithName:@"异常名称" reason:@"异常原因" userInfo:nil]
        NSLog(@"element must not be null");
    }
}

- (BOOL)isEmpty {
    return self.count == 0;
}

@end
