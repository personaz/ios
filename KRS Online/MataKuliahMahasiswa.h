//
//  MataKuliahMahasiswa.h
//  KRS Online
//
//  Created by Surya on 3/28/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MataKuliah, SemesterMahasiswa;

@interface MataKuliahMahasiswa : NSManagedObject

@property (nonatomic, retain) NSNumber * id_mkms;
@property (nonatomic, retain) NSNumber * id_smms;
@property (nonatomic, retain) NSDecimalNumber * ip;
@property (nonatomic, retain) NSString * kode_matkul;
@property (nonatomic, retain) MataKuliah *matKulMSiswaMatKuliah;
@property (nonatomic, retain) SemesterMahasiswa *matKulMSiswaSmMs;

@end
