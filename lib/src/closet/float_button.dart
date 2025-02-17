import 'package:flutter/cupertino.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});
  static const _buttonSize = 56.0;
  static const Color _activeColor = CupertinoColors.activeBlue;

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
        onPressed: () {},
        child: Icon(
          CupertinoIcons.add,
          size: 24,
          color: CupertinoColors.white,
        ),
      ),
    );
  }
}
