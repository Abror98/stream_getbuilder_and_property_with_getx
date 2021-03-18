import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stream_getbuilder_with_getx/contoreller.dart';
import 'package:stream_getbuilder_with_getx/other_screen.dart';
import 'package:stream_getbuilder_with_getx/sumcontoreller.dart';
import 'package:stream_getbuilder_with_getx/usercontoreller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.purple,
        primaryColor: Colors.purpleAccent
      ),
      defaultTransition: Transition.zoom,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final SumContoreller c = Get.put(SumContoreller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Get Package"),
        ),
        body: Column(
          children: [
            Expanded(flex: 1,child: SizedBox()),
            GetBuilder<Contoreller>(
                init: Contoreller(),
                builder:(value) => Text("${value.counter}")),
            SizedBox(height: 20),
            GetX<UserContoreller>(
              init: UserContoreller(),
              builder: (value){
                return Text("Name: ${value.user.value.name}");
              },
            ),
            Obx((){
              return Text("Stored Count: ${Get.find<UserContoreller>().user.value.count}");
            }
            ),
            Obx((){
              return Text("Incement 1: ${c.count1.value}");
            }
            ),
            Obx((){
              return Text("Incement 2: ${c.count2.value}");
            }
            ),
            Obx((){
              return Text("Sum: ${c.sum}");
            }
            ),
            ElevatedButton(
              child: Text("Update Name & Stored Count"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Get.find<UserContoreller>().updateUser(Get.find<Contoreller>().counter);
                }),
            ElevatedButton(
                child: Text("Icrement 1"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                   c.increment();
                }),
            ElevatedButton(
                child: Text("Increment 2"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                 c.increment2();
                }),
            ElevatedButton(
                child: Text("Change Theme"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  if(Get.isDarkMode)
                    Get.changeTheme(ThemeData.light());
                  else
                    Get.changeTheme(ThemeData.dark());
                  print("Is Divice Android?: " + GetPlatform.isAndroid.toString());
                  print("Is Divice IOS?: " + GetPlatform.isIOS.toString());
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () => Get.to(OtherScreen()), child: Text("Go to Other Page", style: TextStyle(fontSize: 10),)),
            Expanded(flex: 1,child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  FloatingActionButton(
                    backgroundColor: Colors.purpleAccent,
                    heroTag: "minus",
                    child: Icon(Icons.exposure_minus_1), onPressed:() {
                      Get.find<Contoreller>().decrement();
                  },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.purpleAccent,
                    heroTag: "plus",
                    child: Icon(Icons.plus_one_outlined), onPressed:() {
                      Get.find<Contoreller>().increment();
                  },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


