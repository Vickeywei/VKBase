//
//  UtilityMacro.h
//  StoryBoard
//
//  Created by 魏琦 on 17/2/15.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#ifndef UtilityMacro_h
#define UtilityMacro_h
#pragma - mark 网络监听

#pragma -mark 资源分类
typedef NS_ENUM(NSInteger,KResourceType) {
    KJournalType = 1,//期刊
    KNotJournalType//非期刊
};
#pragma -mark 首页
typedef NS_ENUM(NSInteger,KShareChannelType) {
    KShareWeixinFriendCircleType = 1,
    KShareWeixinFriendType,
    KShareQQFriendType,
    KShareQzoneType,
    KShareSinaype,
};

typedef NS_ENUM(NSInteger,KRankType){
    KRankAll = -1, // add by wql
    KRankSacnningNumType = 1, //浏览数,
    KRankReadNumType, //阅读数,
    KRankDownLoadNumType,//下载数,
    KRankCollectNumType,//收藏数,
    KRankCommentNumType, //评论数,
    KRankShareNumType,//用户分享是
    KRankLikeNumType,//点赞数
    KRankScoreNumType,//评分
};

typedef NS_ENUM(NSInteger,KClintShowType) {
    KClintShow,
    KWebShow,
    KWapShow
};

typedef NS_ENUM(NSInteger,KClientOSType){
    kAndroidType,//安卓
    kiOSType,//iOS
    kPadType,//pad
    kiPadType//iPad
};

typedef NS_ENUM(NSInteger,KMsgType) {
    KNewsType = 1,//新闻
    KMaintenanceType,//公告
    KSpecialSubjectType,//专题
    KActivityType//活动
};
typedef NS_ENUM(NSInteger, KShowDisCoveryShow){
    KShowDisCovery = 1,//是
    KNotShowDisCovery//否 即首页传2,发现传1
};
typedef NS_ENUM(NSInteger,KType){
    KNoType = 0,//无
    KBookType = 1,//书籍
    KPDFType,//电子文稿
    KPicturesType,//图集
    KAudioType,//音频
    KVideoType//视屏 看看这里什么时候会改过来 add by wql 20161025
};

typedef NS_ENUM(NSInteger, KAdvertPositionType){
    KAdvertFloatingType = 0,
    KAdvertTopType,
    KAdvertBottomType,
    KAdvertLeftType,
    KAdvertRightType
};

#pragma -mark 推荐
typedef NS_ENUM(NSInteger ,KShowStatusType){
    KShowType,
    KHidenType
    
};

#pragma -mark 图书资源
typedef NS_ENUM(NSInteger,KResType){
    KLibraryResourceTypeNotJournal = 1,//(资源)非期刊
    KLibraryResourceTypeJournalType,//期刊
    KLibraryResourceTypeSpecialSubjectType//专题
};
//收藏状态
typedef NS_ENUM(NSInteger, KCollectionStatus){
    KCollectionDefaultStatus = 1,//正常(加入书架)
    KCollectionDeleteStatus,//删除(未加入书架)
    
};
//是否在线阅读
typedef NS_ENUM(NSInteger, KReaderStatus){
    KOffLineReaderStatus = 1,//是
    KOnLineReaderStatus,//否
};

typedef NS_ENUM(NSInteger,KHasSyncStatus){
    KHasSync,
    KNotHasSyncStatus
};
typedef NS_ENUM(NSInteger, KreadTyoe){
    KTopAndBottomReadType,
    KLeftAndRightReadType
};

#pragma -mark 个人中心
typedef NS_ENUM(NSInteger, KMessageType) {
    KMessageTypeOther = 0,//其他
    KMessageTypeSuggest,//建议
    KMessageTypeComplaints,//投诉
    KMessageTypeHelp,//求助
    KMessageTypeCorrection//纠错
};

typedef NS_ENUM(NSInteger, UserSex) {
    UserSexUnknown = 0,//未分配
    UserSexMale,//男
    UserSexFemale//女
};

typedef NS_ENUM(NSInteger, UserCardType) {
    UserCardTypeIdentifierCard = 1,//身份证
    UserCardTypeOfficer,//军官证
    UserCardTypePassport,//护照
    UserCardTypeHongKongAndMacaoPass,//港澳通行证
    UserCardTypeTaiwanPass//台湾通行证
    
};

/*
 //MP3的传输方式
 //    NSString* str = [[NSBundle mainBundle] pathForResource:@"宋秉洋 - 雨天" ofType:@"mp3"];
 //    NSData* data = [NSData dataWithContentsOfFile:str];
 //    NSLog(@"%@",data);
 
 //MP4上传
 //    NSString* str = [[NSBundle mainBundle] pathForResource:@"06-往网页中添加内容(掌握)" ofType:@"mp4"];
 //    NSData* data = [NSData dataWithContentsOfFile:str];
 //TXT格式上传
 //text/txt,text/plain
 
 //pdf上传
 //application/pdf
 
 //git上传
 //image/gif
 
 //ppt上传
 //application/vnd.ms-powerpoint
 
 //docx上传
 //application/vnd.openxmlformats-officedocument.wordprocessingml.document
 
 //xlsx上传
 //application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
 
 //doc文件上传
 //application/msword
 
 //xls上传
 //application/vnd.ms-excel
 
 //pptx上传
 //application/vnd.openxmlformats-officedocument.presentationml.presentation
 */

typedef NS_ENUM(NSInteger, KFileMineType){
    KFileMineTypeMp3 = 1,
    KFileMineTypeMp4,
    KFileMineTypeTXT,
    KFileMineTypePPT,
    KFileMineTypeDOC,
    KFileMineTypeDOCX,
    KFileMineTypeXLS,
    KFileMineTypeXLSX,
    KFileMineTypeJPG,
    KFileMineTypeJEPG,
    KFileMineTypeGIF,
    KFileMineTypePNG,
    KFileMineTypePDF,
    KFileMineTypePPTX
    
};

#endif /* UtilityMacro_h */
