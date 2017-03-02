//
//  StoryBoardTests.m
//  StoryBoardTests
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface StoryBoardTests : XCTestCase

@end

@implementation StoryBoardTests
//每次测试前调用，可以再测试之前创建test case方法中需要用到的一些对象等。
- (void)setUp {
    [super setUp];
   
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
//每次测试结束后调用tearDown方法
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
 
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (NSUInteger)add:(NSUInteger)a b:(NSUInteger)b {
    return a + b;
    
}

- (void)testPerformanceExample {
  
    // This is an example of a performance test case.
    //性能测试方法，通过测试block中方法执行的时间，比对设定的标准值和偏差觉得是否可以通过测试
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
    
- (void)testAsyncExample {
    
}

@end
