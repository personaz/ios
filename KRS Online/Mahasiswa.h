//
//  Mahasiswa.h
//  KRS Online
//
//  Created by Surya on 3/30/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Mahasiswa : NSManagedObject

@property (nonatomic, retain) NSString * alamat;
@property (nonatomic, retain) NSNumber * id_jurusan;
@property (nonatomic, retain) NSNumber * kelamin;
@property (nonatomic, retain) NSString * nama;
@property (nonatomic, retain) NSString * nama_jurusan;
@property (nonatomic, retain) NSString * nim;
@property (nonatomic, retain) NSNumber * program_pendidikan;
@property (nonatomic, retain) NSString * tgl_lahir;
@property (nonatomic, retain) NSString * tgl_masuk;

@end
