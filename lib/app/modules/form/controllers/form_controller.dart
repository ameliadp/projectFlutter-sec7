import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_sec7/app/data/service_api.dart';
import 'package:project_sec7/app/data/product_model.dart';
import 'package:project_sec7/app/modules/home/controllers/home_controller.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();
  TextEditingController titleC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  var labelColor = Colors.grey.obs;

  var selectedValue = ''.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  XFile? image;
  RxString addImage = ''.obs;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      addImage.value = image!.path;
    }
  }

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    titleC.text = product.title ?? '';
    priceC.text = (product.price ?? '').toString();
    descriptionC.text = product.description ?? '';
    addImage.value = product.image ?? '';
    selectedValue.value = product.category ?? '';
  }

  controllerToModel(Product product) {
    product.title = titleC.text;
    product.price = double.tryParse(priceC.text);
    product.description = descriptionC.text;
    product.image = addImage.value;
    product.category = selectedValue.value;
    return Product;
  }

  Future storeProduct(Product product, bool isUpdate) async {
    try {
      product = controllerToModel(product);
      isUpdate == false
          ? await serviceApi.createProduct(product)
          : await serviceApi.updateProduct(product);
      Get.back();
      Get.snackbar('Success', 'Product berhasil disimpan');
    } catch (e) {
      print((e).toString());
    }
  }
}
