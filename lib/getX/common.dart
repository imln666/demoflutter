import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  List cameras = [].obs as List<CameraDescription>;

  void setCameras(list) {
    cameras = list;
    update();
  }
}
