import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopscopeProvider extends ChangeNotifier {
  Future<bool> popScopes(BuildContext context) async {
    print("Correctly passed");
    return await Get.dialog(
      AlertDialog(
        title: const Text("Hello"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    ) ?? false;
  }
}
