import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontWeight(FontWeight.bold).size(14).make(),
        Divider(),
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
                child: Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"))
          ],
        )
      ],
    ).box.color(Colors.blue).padding(EdgeInsets.all(12)).roundedSM.make(),
  );
}
