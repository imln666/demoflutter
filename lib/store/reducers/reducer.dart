import 'package:demoflutter/store/actions/actions.dart';
import 'package:demoflutter/store/state/state.dart';

// Reducer 是一个纯函数，它接收当前的状态和一个动作，然后返回一个新的状态

AppState appReducer(AppState state, dynamic action) {
  if(action is UpdateUserAction) {
    return state.copyWith(user: action.user);
  } else if (action is ToggleThemeModeAction) {
    return state.copyWith(themeMode: action.themeMode);
  } else if (action is ChangeLanguageAction) {
    return state.copyWith(language: action.language);
  }
  return state;
}