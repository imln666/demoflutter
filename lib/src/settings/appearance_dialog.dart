import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appearance_options.dart';

typedef AppearanceSelectedCallback = void Function(int selectedAppearance);

class AppearanceDialog extends StatefulWidget {
  final AppearanceSelectedCallback onAppearanceSelected;
  final int defaultAppearance;

  const AppearanceDialog({super.key, required this.onAppearanceSelected, required this.defaultAppearance});

  @override
  State<AppearanceDialog> createState() => _AppearanceDialogState();
}

class _AppearanceDialogState extends State<AppearanceDialog> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultAppearance;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: Text('外观'),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(appearances.length, (int index) {
            return CupertinoListTile(
              title: Text(appearances[index]),
              backgroundColorActivated: CupertinoColors.transparent,
              trailing: CupertinoRadio(
                value: appearances[index],
                groupValue: appearances[_selectedIndex],
                onChanged: (value) {},
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  widget.onAppearanceSelected(index);
                  Navigator.of(context).pop();
                });
              },
            );
          }),
        )
      ],
    );
  }
}
