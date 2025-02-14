import 'package:flutter/material.dart';

// 状态代表应用中需要管理的数据

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

// 应用状态类
class AppState {
  final User? user;
  final Brightness themeMode;
  final String language;

  AppState({this.user, required this.themeMode, required this.language});

  // 用于创建一个新的状态副本，只更新指定的属性
  AppState copyWith({User? user, Brightness? themeMode, String? language}) {
    return AppState(
        user: user ?? this.user,
        themeMode: themeMode ?? this.themeMode,
        language: language ?? this.language);
  }
}
