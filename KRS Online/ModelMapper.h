//
//  Helper.h
//  KRS Online
//
//  Created by Muhammad Zulham on 3/17/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelMapper : NSObject

// Mahasiswa
- (void)saveMahasiswa:(NSDictionary* )data;
- (NSArray*)fetchRowMahasiswaByNIM:(NSString* )NIM;
- (void)removeMahasiswaWithNIM:(NSString*)NIM;

// News
- (void)saveNews:(NSArray*)data;
- (NSArray*)fetchAllNews;
- (NSDictionary*)fetchRowNewsById:(NSNumber*)idBerita;
- (void)removeAllNews;

//Mata Kuliah
- (void)saveAllMataKuliah:(NSArray*)data;
- (NSArray*)fetchAllMataKuliahWithSemester:(NSNumber*)semester;
- (void)removeAllMataKuliah;
@end
