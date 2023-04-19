import 'package:flutter_douyin/generated/json/base/json_convert_content.dart';
import 'package:flutter_douyin/data/model/user_info.dart';

UserInfo $UserInfoFromJson(Map<String, dynamic> json) {
	final UserInfo userInfo = UserInfo();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userInfo.id = id;
	}
	final String? userName = jsonConvert.convert<String>(json['user_name']);
	if (userName != null) {
		userInfo.userName = userName;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userInfo.password = password;
	}
	final String? tiktokNumber = jsonConvert.convert<String>(json['tiktok_number']);
	if (tiktokNumber != null) {
		userInfo.tiktokNumber = tiktokNumber;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		userInfo.avatar = avatar;
	}
	final String? backgroud = jsonConvert.convert<String>(json['backgroud']);
	if (backgroud != null) {
		userInfo.backgroud = backgroud;
	}
	final String? nickName = jsonConvert.convert<String>(json['nick_name']);
	if (nickName != null) {
		userInfo.nickName = nickName;
	}
	final dynamic tag = jsonConvert.convert<dynamic>(json['tag']);
	if (tag != null) {
		userInfo.tag = tag;
	}
	final dynamic introduction = jsonConvert.convert<dynamic>(json['introduction']);
	if (introduction != null) {
		userInfo.introduction = introduction;
	}
	final int? sex = jsonConvert.convert<int>(json['sex']);
	if (sex != null) {
		userInfo.sex = sex;
	}
	final String? birthday = jsonConvert.convert<String>(json['birthday']);
	if (birthday != null) {
		userInfo.birthday = birthday;
	}
	final dynamic location = jsonConvert.convert<dynamic>(json['location']);
	if (location != null) {
		userInfo.location = location;
	}
	final dynamic school = jsonConvert.convert<dynamic>(json['school']);
	if (school != null) {
		userInfo.school = school;
	}
	final dynamic qrCode = jsonConvert.convert<dynamic>(json['qr_code']);
	if (qrCode != null) {
		userInfo.qrCode = qrCode;
	}
	final dynamic createTime = jsonConvert.convert<dynamic>(json['create_time']);
	if (createTime != null) {
		userInfo.createTime = createTime;
	}
	final dynamic updateTime = jsonConvert.convert<dynamic>(json['update_time']);
	if (updateTime != null) {
		userInfo.updateTime = updateTime;
	}
	return userInfo;
}

Map<String, dynamic> $UserInfoToJson(UserInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['user_name'] = entity.userName;
	data['password'] = entity.password;
	data['tiktok_number'] = entity.tiktokNumber;
	data['avatar'] = entity.avatar;
	data['backgroud'] = entity.backgroud;
	data['nick_name'] = entity.nickName;
	data['tag'] = entity.tag;
	data['introduction'] = entity.introduction;
	data['sex'] = entity.sex;
	data['birthday'] = entity.birthday;
	data['location'] = entity.location;
	data['school'] = entity.school;
	data['qr_code'] = entity.qrCode;
	data['create_time'] = entity.createTime;
	data['update_time'] = entity.updateTime;
	return data;
}