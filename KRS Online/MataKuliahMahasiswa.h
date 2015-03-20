//
//  MataKuliahMahasiswa.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MataKuliah, SemesterMahasiswa;

@interface MataKuliahMahasiswa : NSManagedObject

@property (nonatomic, retain) NSNumber * id_mkms;
@property (nonatomic, retain) NSNumber * id_smms;
@property (nonatomic, retain) NSString * kode_matkul;
@property (nonatomic, retain) NSDecimalNumber * ip;
@property (nonatomic, retain) SemesterMahasiswa *matKulMSiswaSmMs;
@property (nonatomic, retain) MataKuliah *matKulMSiswaMatKuliah;

@end
