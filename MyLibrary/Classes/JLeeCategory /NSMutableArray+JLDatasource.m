//
//  NSMutableArray+DataSource.m
//  testArray
//
//  Created by 李杰 on 2017/3/29.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSMutableArray+JLDatasource.h"


@implementation NSMutableArray (JLDatasource)

- (void)setModel:(id)model atIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    
    if ([self isKindOfClass:[NSMutableArray class]]) {
        
        
        if (self.count < section +1) {
            NSUInteger count = section +1 - self.count;
            for (NSInteger i = 0 ; i< count ; i++) {
                [self addObject:[NSMutableArray array] ];
            }

        }
        
        [self setObject:[NSMutableArray array] atIndexedSubscript:section];
        
        
        NSMutableArray *array = self[section];
        
        if (array.count < row +1) {
            
            NSUInteger count = row +1 - array.count;
            for (NSInteger i = 0 ; i< count ; i++) {
                [array addObject:[NSNull null]];
            }
            
        }
        [array setObject:model atIndexedSubscript:row];
    }
    
}

- (id)modelAtIndexPath:(NSIndexPath *)indexPath
{
    return self[indexPath.section][indexPath.row];
    
}

@end
