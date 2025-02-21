import 'package:demoflutter/src/closet/closet_view.dart';
import 'package:demoflutter/src/settings/appearance_dialog.dart';
import 'package:demoflutter/src/settings/appearance_options.dart';
import 'package:demoflutter/store/actions/actions.dart';
import 'package:demoflutter/store/state/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import '../store/store.dart';
import 'settings/settings_controller.dart';

class _ViewModel {
  final User? user;
  final Brightness themeMode;
  final String language;
  final Function(User) onUpdateUser;
  final Function(Brightness) onToggleTheme;
  final Function(String) onChangeLanguage;

  _ViewModel({
    required this.user,
    required this.themeMode,
    required this.language,
    required this.onUpdateUser,
    required this.onToggleTheme,
    required this.onChangeLanguage,
  });
}

class _ThemeViewModel {
  final Brightness themeMode;
  final Function(Brightness) onToggleTheme;

  _ThemeViewModel({
    required this.themeMode,
    required this.onToggleTheme,
  });
}

class MyApp extends StatefulWidget {
  final SettingsController settingsController;
  const MyApp({super.key, required this.settingsController});

  @override
  State<MyApp> createState() => _MyAppState();
}

int _currentAppearance = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, _ViewModel>(builder: (context, vm) {
          return ListenableBuilder(
            listenable: widget.settingsController,
            builder: (BuildContext context, Widget? child) {
              return GetCupertinoApp(
                theme: CupertinoThemeData(
                  applyThemeToAll: true,
                  scaffoldBackgroundColor: vm.themeMode == Brightness.dark
                      ? Color.fromRGBO(40, 40, 40, 1)
                      : Color.fromRGBO(248, 248, 248, 1) ,
                  brightness: vm.themeMode,
                  primaryColor: vm.themeMode == Brightness.dark
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                ),
                home: HomePage(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        }, converter: (store) {
          return _ViewModel(
              user: store.state.user,
              themeMode: store.state.themeMode,
              language: store.state.language,
              onUpdateUser: (user) => store.dispatch(UpdateUserAction(user)),
              onToggleTheme: (themeMode) =>
                  store.dispatch(ToggleThemeModeAction(themeMode)),
              onChangeLanguage: (language) => ChangeLanguageAction(language));
        }));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star_circle), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clock), label: 'Recent'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: '设置')
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return ClosetView();
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return Text('Recent');
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return SettingPage();
              },
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void _showDialog() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext content) {
          return StoreConnector<AppState, _ThemeViewModel>(
              builder: (context, vm) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 216,
                  padding: EdgeInsets.only(top: 6.0),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  child: SafeArea(
                      top: false,
                      child: AppearanceDialog(
                        defaultAppearance: _currentAppearance,
                        onAppearanceSelected: (selectedAppearance) {
                          setState(() {
                            _currentAppearance = selectedAppearance;
                            vm.onToggleTheme(selectedAppearance == 1
                                ? Brightness.light
                                : Brightness.dark);
                          });
                        },
                      )),
                );
              },
              converter: (store) => _ThemeViewModel(
                  themeMode: store.state.themeMode,
                  onToggleTheme: (themeMode) =>
                      store.dispatch(ToggleThemeModeAction(themeMode))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      padding: EdgeInsets.all(16),
      child: ListView(children: [
        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              CupertinoListTile(
                title: Text('功能'),
                leading: Icon(CupertinoIcons.circle_grid_3x3),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('语言'),
                leading: Icon(CupertinoIcons.globe),
                additionalInfo: Text('简体中文', style: TextStyle(fontSize: 13)),
                trailing: CupertinoListTileChevron(),
                onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => HomeDetailPage())),
              ),
              CupertinoListTile(
                  title: Text('外观'),
                  additionalInfo: Text(
                    appearances[_currentAppearance],
                    style: TextStyle(fontSize: 13),
                  ),
                  leading: Icon(CupertinoIcons.circle_lefthalf_fill),
                  trailing: CupertinoListTileChevron(),
                  onTap: () => _showDialog())
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              CupertinoListTile(
                title: Text('帮助中心'),
                leading: Icon(CupertinoIcons.equal_square),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('问题反馈'),
                leading: Icon(CupertinoIcons.text_bubble),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('推荐给好友'),
                leading: Icon(CupertinoIcons.share),
                trailing: CupertinoListTileChevron(),
                onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => HomeDetailPage())),
              )
            ],
          ),
        ),
        Center(
          child: CupertinoButton(
              child: Text('Go to setting detail'),
              onPressed: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => HomeDetailPage()));
              }),
        ),
      ]),
    ));
  }
}

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Setting detail page'),
      ),
      child: Center(
        child: CupertinoButton(
            child: Text('Go back'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}
