//
//  SBServer.m
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "SBServer.h"
#import <YYKit/YYKit.h>
#import "NSString+DES.h"
#import "NSString+NSHash.h"
#import <WQmacro.h>
//NSString* const KbaseUrl = @"http://122.224.218.58:8088/nlc_read_home/service.do";
NSString* const KbaseUrl = @"http://read.hzdracom.com/nlc_read_home/service.do";

//NSString* const KuploadFile = @"http://122.224.218.58:8080/nlc_read_file/webFileUpload.do";
NSString* const KuploadFile = @"http://read.hzdracom.com/nlc_read_file/webFileUpload.do";
NSString* const MD5Key = @"library_2016@hzlq";
NSString* const DESKey = @"app@hzlq";
//NSString* const KimageBaseUrl = @"http://122.224.218.58:8001";//上传后,返回值必须拼接KimageBaseUrl
NSString* const KimageBaseUrl = @"http://read.hzdracom.com";

@interface SBServer ()
    
@end
@implementation SBServer
- (NSString *)parameterConvertJsonDataWithParameter:(NSDictionary*)parameter {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameter options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
    
- (NSString *)version{
    NSString *version = [[NSBundle mainBundle]objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return version;
}
    
-(long long)currentTimeStamp {
    NSDate *senddate = [NSDate date];
    long long timeStamp =  (long long)[senddate timeIntervalSince1970];
    return timeStamp * 1000;
}
    
- (NSDictionary*)creatRequestParameterWithDic:(NSDictionary*)dic cmd:(NSString*)cmd {
    NSDictionary * requestParameter;
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] initWithDictionary:dic];;
    long long int timeStamp = [self currentTimeStamp];
    [dataDic setObject:@(timeStamp) forKey:@"timeStamp"];
    NSString *siteId = self.siteId.length > 0 ? self.siteId  : @"1";
    long userId = self.userId > 0 ? self.userId : 0;
    NSInteger fromSource = 1;
    NSInteger osType = IS_IPAD ? 4 :2;
    NSString *version = [self version];
    NSInteger versionCode = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] integerValue];
    NSString *desKey = self.appToken.length > 0 ? self.appToken : DESKey;

    NSString *data = [[self parameterConvertJsonDataWithParameter:dataDic] encryptDESWithKey:desKey];
    NSString *hashCode = [[[NSString stringWithFormat:@"%lld",[self currentTimeStamp]] stringByAppendingString:MD5Key] MD5];
    NSDictionary* publicDic = @{
                                @"siteId":siteId,
                                @"userId":@(userId),
                                @"fromSource":@(fromSource),
                                @"osType":@(osType),
                                @"version":version,
                                @"versionCode":@(versionCode),
                                @"data":data,
                                @"timeStamp":@(timeStamp),
                                @"hashCode":hashCode
                                };
    return requestParameter = @{
                                @"cmd":cmd,
                                @"value":[self parameterConvertJsonDataWithParameter:publicDic]
                                
                                };
}

- (void)settingResponseObjectAcceptableContentType{
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    self.requestSerializer.timeoutInterval = 20;
}
    
- (RACSignal *)registWithParameter:(NSDictionary *)parameter cmd:(NSString *)cmd resultClass:(Class)resultClass{
    [self settingResponseObjectAcceptableContentType];
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSDictionary *requestParameter = [self creatRequestParameterWithDic:parameter cmd:cmd];
        
        NSURLSessionDataTask *task = [self POST:KbaseUrl parameters:requestParameter progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([[responseObject objectForKey:@"resultCode"] integerValue] == 1000) {
                id object = [responseObject objectForKey:@"returnObject"];
                if ([object isKindOfClass:[NSDictionary class]]) {
                    NSObject *objc = [resultClass modelWithDictionary:object];
                    object = objc;
                }
                else if ([object isKindOfClass:[NSArray class]]) {
                    NSMutableArray *resultObject  = [[NSMutableArray alloc]init];
                    for (id dic in object) {
                        if ([dic isKindOfClass:[NSDictionary class]]) {
                            NSObject *obj = [resultClass modelWithDictionary:dic];
                            [resultObject addObject:obj];
                            
                        }
                    }
                    object = resultObject;
                }
                if ([cmd isEqualToString:@"qrySiteInfo"]) {
                    self.currentSite = object;
                }
                [subscriber sendNext:object];
                [subscriber sendCompleted];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
            
        }];
        [task resume];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}
@end
