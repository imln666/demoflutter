import 'package:camera/camera.dart';
import 'package:demoflutter/getX/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
List<CameraDescription> cameras = [];

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  Get.put(CommonController());
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Get.find<CommonController>().setCameras(cameras);
  print(cameras);
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(text ?? '无状态widget'),
    );
  }
}

class DemoStateWidget extends StatefulWidget {
  const DemoStateWidget({super.key});

  @override
  State<DemoStateWidget> createState() => _DemoStateWidgetState();
}

class _DemoStateWidgetState extends State<DemoStateWidget> {
  late String text;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = '变化了';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _getBottomItem(IconData icon, String text) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: Colors.grey),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.black,
      ),
      child: _getBottomItem(Icons.zoom_in_map, "22"),
    );
  }
}
