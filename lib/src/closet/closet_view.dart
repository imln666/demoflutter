import 'package:demoflutter/src/closet/closet_detail.dart';
import 'package:demoflutter/src/closet/float_button.dart';
import 'package:flutter/cupertino.dart';

class ClosetView extends StatefulWidget {
  const ClosetView({super.key});

  @override
  State<ClosetView> createState() => _ClosetViewState();
}

class _ClosetViewState extends State<ClosetView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Stack(
            children: [
              GridView.builder(
                itemCount: 5,
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final titles = ['上装', '下装', '鞋子', '包包', '配饰'];
                  return ClosetItemCard(
                      title: titles[index], count: index, onAdd: () {});
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
              ),
              FloatButton()
            ],
    )));
  }
}

class ClosetItemCard extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onAdd;
  const ClosetItemCard(
      {super.key,
      required this.title,
      required this.count,
      required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.systemBackground.resolveFrom(context)),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => ClosetDetail()));
        },
        child: FractionallySizedBox(
          widthFactor: 1.0,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                      Icon(
                        CupertinoIcons.line_horizontal_3,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cardBackground),
                    child: Center(
                      child: Icon(CupertinoIcons.add, size: 32),
                    ),
                  ),
                )
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

// Widget _buildItemCard(
//     BuildContext context, String title, int count, VoidCallback onAdd) {
//   return Container(
//       child: GestureDetector(
//     child: FractionallySizedBox(
//         widthFactor: 1.0,
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 10, bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('$count 个', style: TextStyle(fontSize: 12)),
//                     Icon(CupertinoIcons.line_horizontal_3, size: 20)
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color.fromRGBO(248, 248, 248, 1),
//                   ),
//                   width: double.infinity,
//                   // height: double.infinity,
//                   child: Center(
//                     child: Icon(
//                       CupertinoIcons.add,
//                       size: 32,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )),
//     onTap: () {},
//   ));
// }
