// Store 是 Redux 的核心，它持有应用的状态，并处理状态的更新

import 'package:demoflutter/store/reducers/reducer.dart';
import 'package:demoflutter/store/state/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final store = Store<AppState>(appReducer,
    initialState:
        AppState(user: null, themeMode: Brightness.light, language: 'cn'));
