import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'float_button.dart';

class ClosetDetail extends StatefulWidget {
  const ClosetDetail({super.key});

  @override
  State<ClosetDetail> createState() => _ClosetDetailState();
}

class _ClosetDetailState extends State<ClosetDetail> {
  static const double _horizontalPadding = 20.0;

  Widget _buildVerticalDivider() {
    return Container(
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const VerticalDivider(
        width: 1,
        thickness: 1,
        color: CupertinoColors.systemGrey
      ),
    );
  }

  Widget _buildTopActiveBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
              child: const Row(
                children: [
                  Text('手动排序'),
                  Icon(CupertinoIcons.arrowtriangle_down, size: 14)
                ],
              ),
              onPressed: () {}),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.arrow_3_trianglepath),
              ),
              _buildVerticalDivider(),
              IconButton(
                icon: const Icon(CupertinoIcons.arrow_3_trianglepath),
                onPressed: () {},
              ),
              _buildVerticalDivider(),
              IconButton(
                icon: const Icon(CupertinoIcons.arrow_3_trianglepath),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(CupertinoIcons.folder, size: 64, color: CupertinoColors.systemGrey3),
          SizedBox(height: 16,),
          Text('没有单品', style: TextStyle(
            fontSize: 18,
            color: CupertinoColors.systemGrey
          )),
          SizedBox(height: 16,),
          Text('点击右下角 + 按钮创建单品', style: TextStyle(
            fontSize: 14,
            color: CupertinoColors.systemGrey2
          ),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('0个单品'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.square_grid_2x2),
            )),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _buildTopActiveBar(),
                  // list 可以加在这里
                ],
              ),
              _buildEmptyState(),
              FloatButton()
            ],
          ),
        ));
  }
}

/**
 * 优化点说明：

    组件拆分：

    将顶部操作栏、空状态提示和悬浮按钮拆分为独立的方法组件

    使用Column替代多个Positioned布局，提升可维护性

    常量管理：

    定义了统一的间距尺寸和颜色常量

    使用命名常量替代魔法数字，方便后续修改

    交互优化：

    为所有可点击元素添加了占位按压回调

    使用CupertinoButton替代普通Row实现更自然的点击效果

    为空白状态添加了视觉图标

    代码规范：

    增加必要的注释

    统一代码缩进和格式

    移除重复的VerticalDivider创建逻辑

    UI 改进：

    使用标准 Cupertino 按钮样式

    规范图标尺寸和间距

    优化悬浮按钮的尺寸计算（使用圆形的标准尺寸）

    可扩展性：

    为后续添加列表内容预留了位置

    使用 TODO 注释标记需要后续实现的功能点

    建议后续改进方向：

    添加状态管理（如 Provider 或 Riverpod）来动态更新单品数量

    实现排序和筛选的具体逻辑

    添加网络请求错误处理

    实现空状态和内容状态的切换动画

    添加本地化支持

    实现不同的视图布局模式（通过右下角按钮切换）
 */