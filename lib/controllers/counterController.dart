import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incretment() {
    counter++;
  }
}

class CounterFixturePredictionController extends GetxController {
  increment(currentPrediction) {
    currentPrediction++;
    return currentPrediction;
  }

  decrement(currentPrediction) {
    if (currentPrediction != 0) {
      currentPrediction--;
    }
    return currentPrediction;
  }
}
