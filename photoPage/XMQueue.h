//
//  XMQueue.h
//  photoPage
//
//  Created by 金现代 on 2021/1/15.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMQueue : NSObject

//队列追加
- (void)add:(id) obj;

///队列取出
- (id)next;

///返回队列最前端,不删除队列内元素
- (id)first;

///队列内是否还有元素
- (BOOL) isEmpty;

///队列转array
- (NSArray *) arrayCopy;

@end

NS_ASSUME_NONNULL_END
