import 'package:flutter/material.dart';

class PageindexProvider extends ChangeNotifier{
  int currentIndex = 0;

  void pagess(index){
    currentIndex = index;
    notifyListeners();
  }
}