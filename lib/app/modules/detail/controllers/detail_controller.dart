import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sec7/app/data/product_model.dart';
import 'package:project_sec7/app/data/service_api.dart';

class DetailController extends GetxController {
  final ServiceApi serviceApi = ServiceApi();

  Future<void> deleteProduct(Product product) async {
    try {
      await serviceApi.deleteProduct(product.id.toString());
      Get.snackbar('Success', 'Product berhasil dihapus');
    } catch (e) {
      print(e);
    }
  }

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
