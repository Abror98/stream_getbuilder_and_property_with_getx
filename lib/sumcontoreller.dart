import 'package:get/get.dart';

class SumContoreller extends GetxController{
  final count1 = 0.obs;
  final count2 = 0.obs;

  increment() => count1.value++;
  increment2() => count2.value++;

  int get sum => count1.value + count2.value;

  @override
  void onInit() {
   ever(count1, (_) => print("Count1 has been changed"));
   once(count1, (_) => print("first time Count1 is changed"));
   debounce(count1, (_) => print("Count1 has been changed"), time: Duration(seconds: 1));
   interval(count1, (_) => print("Every 1 second count1 is changed"), time: Duration(seconds: 1));
  }
}