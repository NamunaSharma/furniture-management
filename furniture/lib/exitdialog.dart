import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontWeight(FontWeight.bold).size(14).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit".text.make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"))
          ],
        )
      ],
    ).box.color(Colors.blue).padding(const EdgeInsets.all(12)).roundedSM.make(),
  );
}
