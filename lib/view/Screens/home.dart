import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_handle/controller/page_controller/onboarding_controller.dart';
import 'package:state_handle/provider/state_management/pageindex_provider.dart';
import '../../provider/future_handlers/popscope_provider.dart';
import '../../provider/future_handlers/showdialog_provider.dart';
import '../../provider/state_management/alert_provider.dart';
import '../../provider/state_management/showbottomsheet_provider.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final myshow = context.read<ShowdialogProvider>();
    final alerts = context.read<AlertProvider>();
    final pop = context.read<PopscopeProvider>();
    final showss = context.read<ShowBottomSheetProvider>();
    final myPageController = OnboardingController();
    final newshow = context.read<showing>();
    final pagee = context.watch<PageindexProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column contents
          children: [
            Image.network("https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg"),
            GestureDetector(
              onTap: () {
                myshow.showDialogue(context);
              },
              child: const Text("Click Here"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                alerts.alert(context);
              },
              child: const Text("Ok"),
            ),
            ElevatedButton(
              onPressed: () {
                showss.showBottom(context);
              },
              child: const Text("Ok"),
            ),
            PageView(
              controller: myPageController.pagecontroller,
              onPageChanged: pagee.pagess
            )


          ],
        ),
      ),
    );
  }
}
