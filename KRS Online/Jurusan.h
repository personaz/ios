//
//  Jurusan.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/18/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mahasiswa, MataKuliah;

@interface Jurusan : NSManagedObject

@property (nonatomic, retain) NSNumber * id_jurusan;
@property (nonatomic, retain) NSString * nama_jurusan;
@property (nonatomic, retain) NSNumber * program_pendidikan;
@property (nonatomic, retain) Mahasiswa *jurusanMahasiswa;
@property (nonatomic, retain) NSSet *jurusanMataKuliah;
@end

@interface Jurusan (CoreDataGeneratedAccessors)

- (void)addJurusanMataKuliahObject:(MataKuliah *)value;
- (void)removeJurusanMataKuliahObject:(MataKuliah *)value;
- (void)addJurusanMataKuliah:(NSSet *)values;
- (void)removeJurusanMataKuliah:(NSSet *)values;

@end
