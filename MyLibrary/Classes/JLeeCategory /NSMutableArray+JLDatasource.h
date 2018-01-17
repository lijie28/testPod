//
//  NSMutableArray+DataSource.h
//  testArray
//
//  Created by 李杰 on 2017/3/29.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (JLDatasource)

//+ (instancetype)dataSource;

- (void)setModel:(id)model atIndexPath:(NSIndexPath *)indexPath;

- (id)modelAtIndexPath:(NSIndexPath *)indexPath;

@end
