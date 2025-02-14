import 'package:demoflutter/store/state/state.dart';
import 'package:flutter/material.dart';

// 动作是用于描述状态变化的对象

class UpdateUserAction {
  final User user;
  UpdateUserAction(this.user);
}

class ToggleThemeModeAction {
  final Brightness themeMode;
  ToggleThemeModeAction(this.themeMode);
}

class ChangeLanguageAction {
  final String language;
  ChangeLanguageAction(this.language);
}