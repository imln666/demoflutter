import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClosetView extends StatefulWidget {
  const ClosetView({super.key});

  @override
  State<ClosetView> createState() => _ClosetViewState();
}

class _ClosetViewState extends State<ClosetView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          final titles = ['上装', '下装', '鞋子', '包包', '配饰'];
          return ClosetItemCard(
            title: titles[index],
            count: 0,
            onAdd: () {},
          );
        },
      ),
    );
  }
}

class ClosetItemCard extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onAdd;

  const ClosetItemCard({
    super.key,
    required this.title,
    required this.count,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.systemBackground.resolveFrom(context),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onAdd,
        child: const FractionallySizedBox(
          widthFactor: 1.0,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$count 个',
                        style: TextStyle(fontSize: 12),
                      ),
                      Icon(CupertinoIcons.line_horizontal_3, size: 20),
                    ],
                  ),
                ),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.cardBackground,
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.add,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color cardBackground = Color.fromRGBO(248, 248, 248, 1);
  static const Color borderColor = CupertinoColors.systemGrey;
}