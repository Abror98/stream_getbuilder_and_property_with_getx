import 'package:get/get.dart';
import 'package:stream_getbuilder_with_getx/user.dart';

class UserContoreller extends GetxController{
  final user = User().obs;

  updateUser(int count){
    user.update((val){
      val.name = "Abror";
      val.count = count;
    }
    );
  }
}