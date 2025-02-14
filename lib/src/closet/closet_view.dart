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
      child: GridView.count(
        // 不使用默认的滚动控制器
        primary: false,
        // 设置网格的内边距
        padding: const EdgeInsets.all(15),
        // 每行显示 3 个网格项
        crossAxisCount: 3,
        // 垂直方向上的间距
        mainAxisSpacing: 10,
        // 水平方向上的间距
        crossAxisSpacing: 10,
        children: [
          _buildItemCard(context, '上装', 0, () {}),
          _buildItemCard(context, '下装', 0, () {}),
          _buildItemCard(context, '鞋子', 0, () {}),
          _buildItemCard(context, '包包', 0, () {}),
          _buildItemCard(context, '配饰', 0, () {})
        ],
      ),
    );
  }
}

Widget _buildItemCard(
    BuildContext context, String title, int count, VoidCallback onAdd) {
  return Container(
       decoration: BoxDecoration(
         // 设置卡片边框
        border: Border.all(color: CupertinoColors.systemGrey),
         // 设置卡片圆角
        borderRadius: BorderRadius.circular(10),
         // 根据上下文解析背景颜色
        color: CupertinoColors.systemBackground.resolveFrom(context),
      ),
      child: GestureDetector(
        child: FractionallySizedBox(
            widthFactor: 1.0,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$count 个', style: TextStyle(fontSize: 12)),
                        Icon(CupertinoIcons.line_horizontal_3, size: 20)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(248, 248, 248, 1),
                      ),
                      width: double.infinity,
                      // height: double.infinity,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 32,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
        onTap: () {},
      ));
}
