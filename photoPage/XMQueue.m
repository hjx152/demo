//
//  XMQueue.m
//  photoPage
//
//  Created by 金现代 on 2021/1/19.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "XMQueue.h"

@interface XMQueue()

@property NSMutableArray *array;

@property NSInteger currentIndex;

@end

@implementation XMQueue

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.array = [[NSMutableArray alloc] initWithCapacity:32];
        
    }
    
    return self;
    
}

- (void)add:(id) obj{
    
    if (self.currentIndex >= self.array.count-1) {
        
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:self.array.count*2];
        
        for (id obj in self.array) {
            
            [newArray addObject:obj];
            
        }
        
        self.array = newArray;
        
    }
    
    [self.array addObject:obj];
    
}

- (id)next{
    
    if (![self isEmpty]) {
        id obj = [self.array objectAtIndex:0];
        
        [self.array removeObjectAtIndex:0];
        
        return obj;
    }else{
        return @"Empty";
    }
    
}
- (id)first{
    if (![self isEmpty]) {
        return self.array[0];
    }else{
        return @"Empty";
    }
}
- (BOOL) isEmpty{
    
    return self.array.count == 0;
    
}

@end
