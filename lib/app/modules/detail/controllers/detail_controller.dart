import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

Future<void> showDeleteConfirmationDialog(Function onDelete) async {
  Get.defaultDialog(
    title: 'Are you sure?',
    titleStyle: TextStyle(
      fontFamily: 'Poppin Bold',
      fontWeight: FontWeight.bold,
      color: Color(0xff802c6e),
    ),
    content: Text(
      'Do you really want to delete this product? You will not be able to undo this action!',
      style: TextStyle(
        fontFamily: 'Poppin Regular',
        color: Color(0xff802c6e),
      ),
    ),
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: Color(0xff802c6e),
          ),
        ),
        onPressed: () {
          Get.back();
        },
        child: Text('No'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff802c6e),
          side: BorderSide(
            color: Color(0xff802c6e),
          ),
        ),
        onPressed: () {
          onDelete();
          Get.back();
        },
        child: Text('Yes'),
      ),
    ],
  );
}
