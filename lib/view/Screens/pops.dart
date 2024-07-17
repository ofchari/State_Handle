import 'package:flutter/material.dart';

class Pops extends StatefulWidget {
  const Pops({Key? key ,required this.child,required this.onpopInwolked}) :super(key: key);
  final Widget child;
  final Future<bool> Function() onpopInwolked;

  @override
  State<Pops> createState() => _PopsState();
}

class _PopsState extends State<Pops> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: widget.onpopInwolked,
        child: widget.child
    );
  }
}
