//
//  SemesterMahasiswa.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mahasiswa, MataKuliahMahasiswa;

@interface SemesterMahasiswa : NSManagedObject

@property (nonatomic, retain) NSNumber * id_smms;
@property (nonatomic, retain) NSString * nim;
@property (nonatomic, retain) NSNumber * type_semester;
@property (nonatomic, retain) Mahasiswa *semesterMahasiswaMs;
@property (nonatomic, retain) NSSet *semesterMahasiswaMKulMS;
@end

@interface SemesterMahasiswa (CoreDataGeneratedAccessors)

- (void)addSemesterMahasiswaMKulMSObject:(MataKuliahMahasiswa *)value;
- (void)removeSemesterMahasiswaMKulMSObject:(MataKuliahMahasiswa *)value;
- (void)addSemesterMahasiswaMKulMS:(NSSet *)values;
- (void)removeSemesterMahasiswaMKulMS:(NSSet *)values;

@end
