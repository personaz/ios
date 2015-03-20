//
//  Mahasiswa.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Jurusan, SemesterMahasiswa;

@interface Mahasiswa : NSManagedObject

@property (nonatomic, retain) NSString * nim;
@property (nonatomic, retain) NSString * nama;
@property (nonatomic, retain) NSNumber * kelamin;
@property (nonatomic, retain) NSString * alamat;
@property (nonatomic, retain) NSDate * tgl_lahir;
@property (nonatomic, retain) NSNumber * id_jurusan;
@property (nonatomic, retain) NSDate * tgl_masuk;
@property (nonatomic, retain) Jurusan *mahasiswaJurusan;
@property (nonatomic, retain) NSSet *mahasiswaSmMs;
@end

@interface Mahasiswa (CoreDataGeneratedAccessors)

- (void)addMahasiswaSmMsObject:(SemesterMahasiswa *)value;
- (void)removeMahasiswaSmMsObject:(SemesterMahasiswa *)value;
- (void)addMahasiswaSmMs:(NSSet *)values;
- (void)removeMahasiswaSmMs:(NSSet *)values;

@end
