//
//  MataKuliah.h
//  KRS Online
//
//  Created by Surya on 3/28/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MataKuliahMahasiswa;

@interface MataKuliah : NSManagedObject

@property (nonatomic, retain) NSNumber * id_jurusan;
@property (nonatomic, retain) NSString * kode_matkul;
@property (nonatomic, retain) NSString * nama_matkul;
@property (nonatomic, retain) NSNumber * type_semester;
@property (nonatomic, retain) MataKuliahMahasiswa *mataKuliahMatKulMSiswa;

@end
