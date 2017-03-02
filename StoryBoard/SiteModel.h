//
//  SiteModel.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/16.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "Realm.h"

/*
 "isLocalAuth":1,// 是否本地认证,1是，2否
 "siteId":1,//站点编号
 "name":"浙江杭州分站",//站点名称
 "siteType":1,//站点类型，1=图书馆 2=政府机构
 "shortName":"杭州分站",//简称
 "domain":"gjtsg.zj.com",//域名
 "regionId":1,// 所属大区编号
 "provinceId":1,//所属省份编号
 "provinceName":"浙江",//所属省份名称
 "cityId":1,//所属城市编号
 "cityName":"杭州",//所属城市名称
 "countyId":1,// 所属区县编号
 "countyName":"西湖区",//所属区县名称
 "redirectAddress ":"",//重定向地址
 "isMain ":1,//是否主站，1=是 2=否
 "logoUrl":"http://123.png",//logo地址
 "copyRight ":"浙江杭州西湖区版权所有",//版权信息
 "moduleId":1,//当前模板编号
 "remark ":"这是备注",//备注
 "resCommentFlag": 1,//资源评论开关 1=开 2=关
 "topicCommentFlag": 1,// 专题评论开关 1=开 2=关
 "commentShowFlag": 1,// 评论显示标识 1=都显示（即正常） 2=审核通过才显示（正常+审核通过）
 "themeCode": "jr003",//主题编码
 "themeName": "中秋",//主题名称
 "themeStyle": "zq",//主题样式
 "isDefault": 2//是否默认主题，1=是 2=否

 */

@interface SiteModel : RLMObject
@property NSInteger siteId;
@property NSString* name;
@property NSInteger siteType;
@property NSString* shortName;
@property NSString* domain;
@property NSInteger regionId;
@property NSInteger provinceId;
@property NSString* provinceName;
@property NSInteger cityId;
@property NSString* cityName;
@property NSInteger countyId;
@property NSString* countyName;
@property NSString* redirectAddress;
@property NSInteger isMain; //是否主站 1是主站,2不是主站
@property NSString* logoUrl;
@property NSString* GuotuCopyRight;
@property NSInteger moduleId;//当期模板编号
@property NSString* remark;
@property NSString* themeCode;//主题编码
@property NSString* themeName;//主题名称
@property NSString* themeStyle;//主题样式
@property NSInteger isDefault;//是否默认主题 1=是 2=否
@property NSInteger isLocalAuth;//是否本地认证
@property NSInteger resCommentFlag;//资源评论开关 1开2关
@property NSInteger topicCommentFlag;// 专题评论开关 1=开 2=关
@property NSInteger commentShowFlag; //评论显示标识 1=都显示（即正常） 2=审核通过才显示（正常+审核通过）

@end
