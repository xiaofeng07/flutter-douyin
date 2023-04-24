import 'package:flutter_douyin/generated/json/base/json_field.dart';
import 'package:flutter_douyin/generated/json/video_info.g.dart';
import 'dart:convert';

@JsonSerializable()
class VideoInfo {
	int? id;
	@JSONField(name: "user_id")
	int? userId;
	String? title;
	String? alias;
	@JSONField(name: "pic_user")
	String? picUser;
	@JSONField(name: "pic_url")
	String? picUrl;
	@JSONField(name: "play_url")
	String? playUrl;
	int? sec;
	@JSONField(name: "favorite_num")
	int? favoriteNum;
	@JSONField(name: "comment_num")
	int? commentNum;
	@JSONField(name: "collect_num")
	int? collectNum;
	@JSONField(name: "share_num")
	int? shareNum;
	@JSONField(name: "is_favorite")
	int? isFavorite;
	@JSONField(name: "is_collected")
	int? isCollected;
	@JSONField(name: "create_time")
	String? createTime;
	@JSONField(name: "update_time")
	String? updateTime;
	dynamic topic;

	VideoInfo();

	factory VideoInfo.fromJson(Map<String, dynamic> json) => $VideoInfoFromJson(json);

	Map<String, dynamic> toJson() => $VideoInfoToJson(this);

	VideoInfo copyWith({int? id, int? userId, String? title, String? alias, String? picUser, String? picUrl, String? playUrl, int? sec, int? favoriteNum, int? commentNum, int? collectNum, int? shareNum, int? isFavorite, int? isCollected, String? createTime, String? updateTime, dynamic topic}) {
		return VideoInfo()
			..id= id ?? this.id
			..userId= userId ?? this.userId
			..title= title ?? this.title
			..alias= alias ?? this.alias
			..picUser= picUser ?? this.picUser
			..picUrl= picUrl ?? this.picUrl
			..playUrl= playUrl ?? this.playUrl
			..sec= sec ?? this.sec
			..favoriteNum= favoriteNum ?? this.favoriteNum
			..commentNum= commentNum ?? this.commentNum
			..collectNum= collectNum ?? this.collectNum
			..shareNum= shareNum ?? this.shareNum
			..isFavorite= isFavorite ?? this.isFavorite
			..isCollected= isCollected ?? this.isCollected
			..createTime= createTime ?? this.createTime
			..updateTime= updateTime ?? this.updateTime
			..topic= topic ?? this.topic;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}