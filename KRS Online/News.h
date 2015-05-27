//
//  News.h
//  KRS Online
//
//  Created by Surya on 3/28/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface News : NSManagedObject

@property (nonatomic, retain) NSNumber * id_news;
@property (nonatomic, retain) NSString * isi;
@property (nonatomic, retain) NSString * judul;
@property (nonatomic, retain) NSDate * tanggal_berita;

@end
