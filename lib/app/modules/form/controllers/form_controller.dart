import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  var selectedValue = 'Cardigan Vest'.obs; 

  final count = 0.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  } 

  XFile? image;
  RxString addImage = ''.obs;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      addImage.value = image!.path!;
    }
  }
  
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
