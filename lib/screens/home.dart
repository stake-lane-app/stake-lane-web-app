import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/controllers/counterController.dart';
import 'package:stake_lane_web_app/screens/other.dart';

class HomeScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Clicks: ${counterController.counter.value}")),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(OtherScreen());
                    },
                    child: Text("Open Other Screen")),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {counterController.incretment();},
        child: Icon(Icons.add),
      ),
    );
  }
}
