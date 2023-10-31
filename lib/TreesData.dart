import 'package:flutter/material.dart';

class TreesData extends StatelessWidget {
  final String Variety;
  final int Value;
  // ignore: non_constant_identifier_names
  const TreesData({super.key, required this.Variety, required this.Value});

  @override
  Widget build(BuildContext context) {
    Image Thumbnail;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [Text(Variety), Text(Value.toString()), Text('data')],
            )
          ],
        ),
      ),
    );
  }
}
