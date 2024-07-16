import 'package:flutter/material.dart';

class ShowBottomSheetProvider extends ChangeNotifier{
   void showBottom(BuildContext context){
     showBottomSheet(
         context: context,
         builder: (BuildContext context){
           return Container(
             height: 100,
             width: 300,
             decoration: BoxDecoration(
               color: Colors.green
             ),
             child: Column(
               children: [
                 ElevatedButton(onPressed: (){
                   Navigator.pop(context);
                 }, child: Text("Close"))
               ],
             ),
           );
         }
     );
   }

}