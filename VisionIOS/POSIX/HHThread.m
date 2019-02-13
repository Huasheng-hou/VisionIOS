//
//  HHThread.m
//  VisionIOS
//
//  Created by shen on 2019/2/12.
//  Copyright © 2019 华生侯. All rights reserved.
//

#import "HHThread.h"

#import "pthread.h"
#import "semaphore.h"

sem_t *sem;

void *operate(void *param) {
    
    sem_wait(sem);
    NSLog(@"first thread try!\n");
    sleep(5);
    NSLog(@"first thread post!\n");
    sem_post(sem);
    pthread_exit((void*)0);
}

void *secondPthread(void *param) {
    
    sem_wait(sem);
    NSLog(@"second thread waked!\n");
    sleep(5);
    sem_post(sem);
    
    pthread_exit((void*)0);
}

@implementation HHThread

- (void)test {
    
    pthread_t thread1;
    pthread_t thread2;
    
    sem = sem_open("name_sem", O_CREAT|O_RDWR, 0666, 1);
    
    pthread_create(&thread1, NULL, operate, NULL);
    pthread_create(&thread2, NULL, secondPthread, NULL);
}

@end
