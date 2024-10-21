import 'dart:convert';

import 'package:cryplet/shared/constants/app_config.dart';

class UserModel {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final String? username;
  final bool? verified;
  final bool? emailVisibility;
  final String? email;
  final DateTime? created;
  final DateTime? updated;
  final String? name;
  final String? avatar;

  UserModel({
    this.id,
    this.collectionId,
    this.collectionName,
    this.username,
    this.verified,
    this.emailVisibility,
    this.email,
    this.created,
    this.updated,
    this.name,
    this.avatar,
  });

  String? get avatarUrl {
    if (avatar == null) {
      return null;
    }
    return '${AppConfig.appBaseUrl}/api/files/${collectionId!}/${id!}/${avatar!}';
  }

  UserModel copyWith({
    String? id,
    String? collectionId,
    String? collectionName,
    String? username,
    bool? verified,
    bool? emailVisibility,
    String? email,
    DateTime? created,
    DateTime? updated,
    String? name,
    String? avatar,
  }) =>
      UserModel(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        username: username ?? this.username,
        verified: verified ?? this.verified,
        emailVisibility: emailVisibility ?? this.emailVisibility,
        email: email ?? this.email,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        collectionId: json['collectionId'],
        collectionName: json['collectionName'],
        username: json['username'],
        verified: json['verified'],
        emailVisibility: json['emailVisibility'],
        email: json['email'],
        created:
            json['created'] == null ? null : DateTime.parse(json['created']),
        updated:
            json['updated'] == null ? null : DateTime.parse(json['updated']),
        name: json['name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'collectionId': collectionId,
        'collectionName': collectionName,
        'username': username,
        'verified': verified,
        'emailVisibility': emailVisibility,
        'email': email,
        'created': created?.toIso8601String(),
        'updated': updated?.toIso8601String(),
        'name': name,
        'avatar': avatar,
      };

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
