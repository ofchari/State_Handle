import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowbootomProvider extends ChangeNotifier{
  Future<void> showBottomSheet() async{
     await Get.bottomSheet(
      Container(
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("ShowModalSheet"),
              trailing: Icon(Icons.start),
            )
          ],
        ),
      )
    );
  }
}