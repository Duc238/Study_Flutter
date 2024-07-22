import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class Box extends StatelessWidget {
  Box(
      {super.key,
      required this.item,
      required this.handleDelete,
      required this.index});
  var item;
  var index;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: (index % 2 != 0) ? Colors.lightBlue : Colors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.Name),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.Id);
                } else {
                  return;
                }
              },
              child: Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}
