import 'package:flutter/material.dart';

import '../../view/Screens/home.dart';
import '../../view/Screens/samples.dart';


class BottomProvider extends ChangeNotifier{
  int currentindex = 0;

  final pages = [
    const Home(),
    const Sample()
  ];

  void krish(int index){
    currentindex = index;
    notifyListeners();
  }
}