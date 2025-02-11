import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

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
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: ListView.builder(itemBuilder: (content, index) {
        return Card(
          child: MaterialButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 6, bottom: 2),
                        alignment: Alignment.topLeft,
                        child: Text('这是描述',
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 14),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis)),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getBottomItem(Icons.star, '1000'),
                        _getBottomItem(Icons.link, '1000'),
                        _getBottomItem(Icons.subject, '1000'),
                      ],
                    )
                  ],
                ),
              )),
        );
      }, itemCount: 24, padding: EdgeInsets.all(10),)
    );
  }
}
