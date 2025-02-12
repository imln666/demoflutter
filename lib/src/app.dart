import 'package:flutter/cupertino.dart';
import 'settings/settings_controller.dart';


class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return CupertinoApp(
          theme: CupertinoThemeData(brightness: Brightness.light),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );

      },
    );
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.star_circle), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.clock), label: 'Recent'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: '设置')
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch(index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return Text('Favorites');
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


class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('setting'),
      ),
      child: Center(
        child: CupertinoButton(child: Text('Go to setting detail'), onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => HomeDetailPage())
          );
        }),
      ),
    );
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
        child: CupertinoButton(child: Text('Go back'), onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
    );
  }
}

