import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/state_management/alert_provider.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  late double height;
  late double width;
  int currentindex = 0;
  List<String> a = [
        "https://t3.ftcdn.net/jpg/06/01/17/18/360_F_601171827_GwbDHEuhisbGFXRfIpXFhtf7wAvsbLut.jpg",
        "https://img.freepik.com/premium-photo/happy-cartoon-3d-programmer-hacker_1124848-5458.jpg",
        "https://img.freepik.com/free-photo/3d-rendering-kid-playing-digital-game_23-2150898496.jpg",
        "https://img.freepik.com/free-photo/3d-rendering-kid-playing-digital-game_23-2150898492.jpg",
        "https://png.pngtree.com/background/20231016/original/pngtree-young-gamer-engrossed-in-video-game-on-computer-with-ample-copy-picture-image_5581320.jpg"
  ];
  final items = List<String>.generate(10, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        ScreenUtil.init(context,designSize: Size(width, height),minTextAdapt: true,splitScreenMode: true);
        if(width<=600){
          return _smallbuildlayout();
        }
        else{
          return const Text("Large");
        }
      },
      ),
    );
  }
  Widget _smallbuildlayout(){
    final alertts = context.read<AlertProvider>();
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Draggable //
              Draggable(
                data: Colors.blue,
                  onDraggableCanceled: (Velocity,Offset){},
                  feedback: Container(
                    height: height/8.h,
                    width: width/2.w,
                    color: Colors.black,
                    child: const Center(child: Text("Drah")),
                  ),
                  child: Container(
                    height: height/10.h,
                    width: width/2.w,
                    color: Colors.blue,
                    child: const Center(child: Text("Draggable")),
                  ),
              ),
              const SizedBox(height: 30,),
              // Indexed Stack  same as Bottom naviagtion//
              IndexedStack(
                index: currentindex,
                children: [
                  Container(
                    height: height/6.h,
                    width: width/2.w,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     image: const DecorationImage(
                       image: NetworkImage("https://ih1.redbubble.net/image.3351465130.0208/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg")
                     )
                   ),
                  ),
                  Container(
                    height: height/6.h,
                    width: width/2.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png")
                        )
                    ),
                  ),
                  Container(
                    height: height/6.h,
                    width: width/2.w,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1200px-Git_icon.svg.png")
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentindex = 0;
                      });
                    },
                    child: Container(
                      height: height/18.h,
                      width: width/6.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentindex = 1;
                      });
                    },
                    child: Container(
                      height: height/18.h,
                      width: width/6.w,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentindex = 2;
                      });
                    },
                    child: Container(
                      height: height/18.h,
                      width: width/6.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
               ],
              ),
              const SizedBox(height: 50,),
              SizedBox(
                height: height / 3,
                width: double.infinity,
                child: ListWheelScrollView(
                  itemExtent: height / 10,
                  diameterRatio: 1,
                  offAxisFraction: 0, // Use 0 to center the items horizontally
                  physics: const FixedExtentScrollPhysics(),
                  children: List.generate(
                    a.length,
                        (index) => Container(
                      height: height / 10,
                      width: width / 1.1,
                      margin: const EdgeInsets.symmetric(vertical: 5), // Adds vertical spacing between items
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(a[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                alertts.alert(context);
              }, child: const Text("Ok"))

            ],
          ),
        )
      )
        );
  }
}
//


// class newscroll extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final items = List<String>.generate(10, (i) => "Item $i");
//
//     return Center(
//       child: Container(
//         height: 800,
//         child: ListWheelScrollView(
//           itemExtent: 100,
//           diameterRatio: 1.5,
//           physics: FixedExtentScrollPhysics(),
//           children: items.map((item) {
//             return Container(
//               height: 100,
//               alignment: Alignment.center,
//               color: Colors.blue,
//               child: Text(
//                 item,
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
class scrolls extends StatelessWidget {
  final List<String> images = [
    "https://t3.ftcdn.net/jpg/06/01/17/18/360_F_601171827_GwbDHEuhisbGFXRfIpXFhtf7wAvsbLut.jpg",
    "https://img.freepik.com/premium-photo/happy-cartoon-3d-programmer-hacker_1124848-5458.jpg",
    "https://img.freepik.com/free-photo/3d-rendering-kid-playing-digital-game_23-2150898496.jpg",
    "https://img.freepik.com/free-photo/3d-rendering-kid-playing-digital-game_23-2150898492.jpg",
    "https://png.pngtree.com/background/20231016/original/pngtree-young-gamer-engrossed-in-video-game-on-computer-with-ample-copy-picture-image_5581320.jpg"
        "https://t3.ftcdn.net/jpg/06/01/17/18/360_F_601171827_GwbDHEuhisbGFXRfIpXFhtf7wAvsbLut.jpg",
    "https://img.freepik.com/premium-photo/happy-cartoon-3d-programmer-hacker_1124848-5458.jpg",
    "https://img.freepik.com/free-photo/3d-rendering-kid-playing-digital-game_23-2150898496.jpg",
    "https://img.freepik.com/free-photo/3d-rendering-kid-playing-digital-game_23-2150898492.jpg",
    "https://png.pngtree.com/background/20231016/original/pngtree-young-gamer-engrossed-in-video-game-on-computer-with-ample-copy-picture-image_5581320.jpg"
  ];

   scrolls({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: height / 1,
        child: ListWheelScrollView(
          itemExtent: height / 6,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          children: images.map((image) {
            return Container(
              // height: height / 1,
              width: width / 1.1,
              // margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
