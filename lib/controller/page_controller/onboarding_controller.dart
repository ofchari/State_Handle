import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingController{
  final pagecontroller = PageController();

  void nextpage() => pagecontroller.nextPage(duration: Duration(seconds: 2), curve: Curves.easeIn);

  void previouspage(){
    pagecontroller.previousPage(duration: Duration(seconds: 2), curve: Curves.easeIn);
  }
}