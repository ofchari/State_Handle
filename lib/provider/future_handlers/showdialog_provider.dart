import 'package:flutter/material.dart';

class ShowdialogProvider extends ChangeNotifier{
  Future<void> showDialogue(BuildContext context)async{
    notifyListeners();
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Hii"),
            icon: const Icon(Icons.tag),
            actions: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: const Text("Hii")),
              const Text("Hello"),
            ],
          );
        }
    );
  }
}

class showing extends ChangeNotifier{
  Future<void> showse(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(

          );
        }
    );
  }
}