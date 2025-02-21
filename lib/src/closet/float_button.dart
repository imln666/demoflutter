import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});
  static const _buttonSize = 56.0;
  static const Color _activeColor = CupertinoColors.activeBlue;

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('创建单品'),
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  // isDefaultAction: true,
                  // isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('拍照'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: const Text('从相册选取'),
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('取消'),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: CupertinoButton(
        minSize: _buttonSize,
        padding: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(_buttonSize / 2),
        color: _activeColor,
        onPressed: () {
          _showActionSheet(context);
        },
        child: Icon(
          CupertinoIcons.add,
          size: 24,
          color: CupertinoColors.white,
        ),
      ),
    );
  }
}


class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePictureScreen({super.key, required this.camera});

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder(future: _initializeControllerFuture, builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller);
        } else {
          return const Center(child: CupertinoActivityIndicator());
        }
      }),
    );
  }
}
