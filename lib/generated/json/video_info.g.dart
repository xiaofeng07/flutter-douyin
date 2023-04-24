import 'package:flutter_douyin/generated/json/base/json_convert_content.dart';
import 'package:flutter_douyin/data/model/video_info.dart';

VideoInfo $VideoInfoFromJson(Map<String, dynamic> json) {
	final VideoInfo videoInfo = VideoInfo();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		videoInfo.id = id;
	}
	final int? userId = jsonConvert.convert<int>(json['user_id']);
	if (userId != null) {
		videoInfo.userId = userId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		videoInfo.title = title;
	}
	final String? alias = jsonConvert.convert<String>(json['alias']);
	if (alias != null) {
		videoInfo.alias = alias;
	}
	final String? picUser = jsonConvert.convert<String>(json['pic_user']);
	if (picUser != null) {
		videoInfo.picUser = picUser;
	}
	final String? picUrl = jsonConvert.convert<String>(json['pic_url']);
	if (picUrl != null) {
		videoInfo.picUrl = picUrl;
	}
	final String? playUrl = jsonConvert.convert<String>(json['play_url']);
	if (playUrl != null) {
		videoInfo.playUrl = playUrl;
	}
	final int? sec = jsonConvert.convert<int>(json['sec']);
	if (sec != null) {
		videoInfo.sec = sec;
	}
	final int? favoriteNum = jsonConvert.convert<int>(json['favorite_num']);
	if (favoriteNum != null) {
		videoInfo.favoriteNum = favoriteNum;
	}
	final int? commentNum = jsonConvert.convert<int>(json['comment_num']);
	if (commentNum != null) {
		videoInfo.commentNum = commentNum;
	}
	final int? collectNum = jsonConvert.convert<int>(json['collect_num']);
	if (collectNum != null) {
		videoInfo.collectNum = collectNum;
	}
	final int? shareNum = jsonConvert.convert<int>(json['share_num']);
	if (shareNum != null) {
		videoInfo.shareNum = shareNum;
	}
	final int? isFavorite = jsonConvert.convert<int>(json['is_favorite']);
	if (isFavorite != null) {
		videoInfo.isFavorite = isFavorite;
	}
	final int? isCollected = jsonConvert.convert<int>(json['is_collected']);
	if (isCollected != null) {
		videoInfo.isCollected = isCollected;
	}
	final String? createTime = jsonConvert.convert<String>(json['create_time']);
	if (createTime != null) {
		videoInfo.createTime = createTime;
	}
	final String? updateTime = jsonConvert.convert<String>(json['update_time']);
	if (updateTime != null) {
		videoInfo.updateTime = updateTime;
	}
	final dynamic topic = jsonConvert.convert<dynamic>(json['topic']);
	if (topic != null) {
		videoInfo.topic = topic;
	}
	return videoInfo;
}

Map<String, dynamic> $VideoInfoToJson(VideoInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['user_id'] = entity.userId;
	data['title'] = entity.title;
	data['alias'] = entity.alias;
	data['pic_user'] = entity.picUser;
	data['pic_url'] = entity.picUrl;
	data['play_url'] = entity.playUrl;
	data['sec'] = entity.sec;
	data['favorite_num'] = entity.favoriteNum;
	data['comment_num'] = entity.commentNum;
	data['collect_num'] = entity.collectNum;
	data['share_num'] = entity.shareNum;
	data['is_favorite'] = entity.isFavorite;
	data['is_collected'] = entity.isCollected;
	data['create_time'] = entity.createTime;
	data['update_time'] = entity.updateTime;
	data['topic'] = entity.topic;
	return data;
}