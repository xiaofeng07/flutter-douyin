import 'package:flutter_douyin/generated/json/base/json_field.dart';
import 'package:flutter_douyin/generated/json/user_info.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserInfo {
	int? id;
	@JSONField(name: "user_name")
	String? userName;
	String? password;
	@JSONField(name: "tiktok_number")
	String? tiktokNumber;
	String? avatar;
	String? backgroud;
	@JSONField(name: "nick_name")
	String? nickName;
	dynamic tag;
	dynamic introduction;
	int? sex;
	String? birthday;
	dynamic location;
	dynamic school;
	@JSONField(name: "qr_code")
	dynamic qrCode;
	@JSONField(name: "create_time")
	dynamic createTime;
	@JSONField(name: "update_time")
	dynamic updateTime;

	UserInfo();

	factory UserInfo.fromJson(Map<String, dynamic> json) => $UserInfoFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoToJson(this);

	UserInfo copyWith({int? id, String? userName, String? password, String? tiktokNumber, String? avatar, String? backgroud, String? nickName, dynamic tag, dynamic introduction, int? sex, String? birthday, dynamic location, dynamic school, dynamic qrCode, dynamic createTime, dynamic updateTime}) {
		return UserInfo()
			..id= id ?? this.id
			..userName= userName ?? this.userName
			..password= password ?? this.password
			..tiktokNumber= tiktokNumber ?? this.tiktokNumber
			..avatar= avatar ?? this.avatar
			..backgroud= backgroud ?? this.backgroud
			..nickName= nickName ?? this.nickName
			..tag= tag ?? this.tag
			..introduction= introduction ?? this.introduction
			..sex= sex ?? this.sex
			..birthday= birthday ?? this.birthday
			..location= location ?? this.location
			..school= school ?? this.school
			..qrCode= qrCode ?? this.qrCode
			..createTime= createTime ?? this.createTime
			..updateTime= updateTime ?? this.updateTime;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}