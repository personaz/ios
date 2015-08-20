//
//  Helper.m
//  KRS Online
//
//  Created by Muhammad Zulham on 3/17/15.
//  Copyright (c) 2015 Zulham. All rights reserved.
//

#import "ModelMapper.h"
#import "AppDelegate.h"
// Model
#import "Mahasiswa.h"
#import "News.h"
#import "MataKuliah.h"

@interface ModelMapper()
@property (strong, nonatomic) NSManagedObjectContext* context;

@end

@implementation ModelMapper
@synthesize context;

- (NSManagedObjectContext*)getManagetObjectContext {
    if (context == nil) {
        AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
        context = [appDelegate managedObjectContext];
    }
    return context;
}

- (void)saveMahasiswa:(NSDictionary *)data {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    Mahasiswa* ms = [[self fetchRowMahasiswaByNIM:[data valueForKey:@"nim"]] firstObject];
    if (!ms) {
        ms = [NSEntityDescription insertNewObjectForEntityForName:@"Mahasiswa" inManagedObjectContext:objectContext];
    }
    ms.nim = [data objectForKey:@"nim"];
    ms.nama = [data objectForKey:@"nama"];
    ms.alamat = [data objectForKey:@"alamat"];
    ms.kelamin = [NSNumber numberWithInt:[[data objectForKey:@"kelamin"] intValue]];
    ms.id_jurusan = [NSNumber numberWithInt:[[data objectForKey:@"id_jurusan"] intValue]];
    ms.nama_jurusan = [data objectForKey:@"nama_jurusan"];
    ms.tgl_lahir = [data objectForKey:@"tgl_lahir"];
    ms.tgl_masuk = [data objectForKey:@"tgl_masuk"];
    ms.program_pendidikan = [NSNumber numberWithInt:[[data objectForKey:@"prog_pendidikan"] intValue]];
    
    NSError *isError;
    if (![objectContext save:&isError]) {
        NSLog(@"Error while save mahasiswa %@, %@", isError, [isError userInfo]);
    }
}

- (NSArray*)fetchRowMahasiswaByNIM:(NSString* )NIM {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    NSEntityDescription* mahasiswa = [NSEntityDescription entityForName:@"Mahasiswa" inManagedObjectContext:objectContext];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"nim = %@", NIM];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setReturnsObjectsAsFaults:NO];
    [request setEntity:mahasiswa];
    [request setPredicate:predicate];
    NSError *error;
    
    NSArray* retu = [objectContext executeFetchRequest:request error:&error];
    if (!retu) {
        return nil;
    }
    return retu;
}

- (void)removeMahasiswaWithNIM:(NSString *)NIM {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    Mahasiswa* ms = [[self fetchRowMahasiswaByNIM:NIM] firstObject];
    [objectContext deleteObject:ms];
    NSError* error;
    if (![objectContext save:&error]) {
        NSLog(@"Error while delete Mahasiswa %@, %@", error, [error userInfo]);
    }
}

- (void)saveNews:(NSArray *)data {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    for (NSUInteger i = 0; i < [data count]; i++) {
        NSNumber* idBerita = [NSNumber numberWithInt:[[[data objectAtIndex:i] objectForKey:@"id"] intValue]];
        if (![self fetchRowNewsById:idBerita]) {
            News* berita = [NSEntityDescription insertNewObjectForEntityForName:@"News" inManagedObjectContext:objectContext];
            berita.id_news = idBerita;
            berita.isi = [[data objectAtIndex:i] objectForKey:@"isi"];
            berita.judul = [[data objectAtIndex:i] objectForKey:@"judul"];
            berita.tanggal_berita = [format dateFromString:[[data objectAtIndex:i] objectForKey:@"tanggalBerita"]];
        }
    }
    
    NSError* error;
    if (![objectContext save:&error]) {
        NSLog(@"Error while save berita %@, %@", error, [error userInfo]);
    }
}

- (NSArray *)fetchAllNews {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    NSEntityDescription* news = [NSEntityDescription entityForName:@"News" inManagedObjectContext:objectContext];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:nil];
    NSSortDescriptor* orderBy = [NSSortDescriptor sortDescriptorWithKey:@"tanggal_berita" ascending:NO];
    NSSortDescriptor* orderById = [NSSortDescriptor sortDescriptorWithKey:@"id_news" ascending:NO];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setReturnsObjectsAsFaults:NO];
    [request setEntity:news];
    [request setPredicate:predicate];
    [request setSortDescriptors:@[orderBy, orderById]];
    NSError* error;
    
    NSArray* allNews = [objectContext executeFetchRequest:request error:&error];
    if (!allNews) {
        return nil;
    }
    return allNews;
}

- (NSDictionary *)fetchRowNewsById:(NSNumber *)idBerita {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    NSEntityDescription* news = [NSEntityDescription entityForName:@"News" inManagedObjectContext:objectContext];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"id_news = %@", idBerita];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:news];
    [request setPredicate:predicate];
    NSError* error;
    
    NSDictionary* rowNews = [[objectContext executeFetchRequest:request error:&error] firstObject];
    if (!rowNews) {
        return nil;
    }
    return rowNews;
}

- (void)removeAllNews {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    NSArray* allNews = [self fetchAllNews];
    for (int i = 0; i < [allNews count]; i++) {
        News* berita = [allNews objectAtIndex:i];
        [objectContext deleteObject:berita];
    }
    NSError* error;
    if (![objectContext save:&error]) {
        NSLog(@"Error while delete %@, %@", error, [error userInfo]);
    }
}

- (void)saveAllMataKuliah:(NSArray *)data {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    
    for (NSUInteger i = 0; i < [data count]; i++) {
        MataKuliah* matkul = [NSEntityDescription insertNewObjectForEntityForName:@"MataKuliah" inManagedObjectContext:objectContext];
        matkul.id_jurusan = [NSNumber numberWithInt:[[[data objectAtIndex:i] objectForKey:@"id_jurusan"] intValue]];
        matkul.kode_matkul = [[data objectAtIndex:i] objectForKey:@"kode_matkul"];
        matkul.nama_matkul = [[data objectAtIndex:i] objectForKey:@"nama_matkul"];
        matkul.type_semester = [NSNumber numberWithInt:[[[data objectAtIndex:i] objectForKey:@"type_semester"] intValue]];
    }
    
    NSError* error;
    if (![objectContext save:&error]) {
        NSLog(@"Error on Mata Kuliah at %@, %@", error, [error userInfo]);
    }
}

- (NSArray *)fetchAllMataKuliahWithSemester:(NSNumber *)semester {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"MataKuliah" inManagedObjectContext:objectContext];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:nil];
    if (semester > 0) {
        predicate = [NSPredicate predicateWithFormat:@"type_semester = %@", semester];
    }
    NSSortDescriptor* byCode = [NSSortDescriptor sortDescriptorWithKey:@"kode_matkul" ascending:YES];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setReturnsObjectsAsFaults:NO];
    [request setEntity:entity];
    [request setPredicate:predicate];
    [request setSortDescriptors:@[byCode]];
    NSError* error;
    
    NSArray* allMatkul = [objectContext executeFetchRequest:request error:&error];
    if (!allMatkul) {
        return nil;
    }
    return allMatkul;
}

- (void)removeAllMataKuliah {
    NSManagedObjectContext* objectContext = [self getManagetObjectContext];
}

@end
