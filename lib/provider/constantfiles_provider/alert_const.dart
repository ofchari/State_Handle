import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_handle/provider/state_management/alert_provider.dart';

class AlertConst{
   Widget(BuildContext context){
    final alerts = context.read<AlertProvider>();
   }
}
