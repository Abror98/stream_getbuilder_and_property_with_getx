
import 'dart:async';

import 'package:get/get.dart';

class Contoreller extends GetxController{
  StreamController<int> streamController = StreamController<int>();

   int counter = 0;

   void increment(){
     counter++;
     update();
   }

   void decrement(){
     counter--;
     update();
   }

  @override
  void onClose() {
   streamController.close();
    super.onClose();
  }

}