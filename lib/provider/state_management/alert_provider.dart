import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertProvider extends ChangeNotifier{
  void alert(BuildContext context) async{
    notifyListeners();
    Alert(
        context: context,
      type: AlertType.success,
      buttons: [
        DialogButton(
            child: const Text("Yes"),
            onPressed: (){
              Navigator.pop(context);
            }
        )
      ]

    ).show();


  }
}