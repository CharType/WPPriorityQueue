# WPPriorityQueue
OC版本优先级队列



/// @capacity 容量
/// @comparator 比较器
- (instancetype)initWithCapacity:(NSInteger)capacity comparator:(WPPriorityQueueComparator)comparator;
/// @array 初始化队列中的数据
/// @comparator 比较器
- (instancetype)initWithArray:(NSArray<ObjectType> *)array comparator:(WPPriorityQueueComparator)comparator;

///清空所有数据
- (void)clear;

/// 将数据加入队列中
- (void)enQueue:(ObjectType)element;

/// 队列优先级最高的数据出队
- (ObjectType)deQueue;

/// 删除队列中的指定数据，会重新调整队列数据的位置 
- (void)removeElement:(ObjectType)element;

/// 查看队顶元素，不会出队列
- (ObjectType)front;
 
/// 判断队列是否是空
- (BOOL)isEmpty;

/// 获取队列中的元素数量
- (NSInteger)size;