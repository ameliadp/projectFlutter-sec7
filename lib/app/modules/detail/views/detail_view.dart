import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_sec7/app/routes/app_pages.dart';

import '../controllers/detail_controller.dart';
import 'package:project_sec7/app/modules/home/controllers/home_controller.dart';
import 'package:project_sec7/app/data/product_model.dart';

class DetailView extends GetView<DetailController> {
  final HomeController homeController = Get.put(HomeController());
  Product product = Get.arguments ?? Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logoPurple.png',
                width: 40,
                height: 40,
              ),
            ),
            const Text(
              'Fake Store',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Color(0xff802c6e),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //images
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            width: 400,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Image.network(
              product.image ?? "",
              width: 230,
              height: 230,
            ),
          ),
          SizedBox(height: 5),
          //title
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Text(
              product.title ?? "",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          //rating
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 20,
                width: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: index == 0 && (product.rating?.rate ?? 0) >= 1.0
                        ? Colors.yellow
                        : index == 1 && (product.rating?.rate ?? 0) >= 2.0
                            ? Colors.yellow
                            : index == 2 && (product.rating?.rate ?? 0) >= 3.0
                                ? Colors.yellow
                                : Colors.grey,
                    size: 15,
                  ),
                ),
              ),
              Text(
                '${product.rating?.rate ?? 0.0} | ${product.rating?.count ?? 0}',
                style: TextStyle(
                  fontSize: 8,
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          //price
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$${product.price?.toStringAsFixed(2) ?? 0}',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Product Details',
                style: TextStyle(
                  fontFamily: 'Poppins Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          //description
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${product.description ?? ""}',
                style: TextStyle(
                  fontFamily: 'Poppins Regular',
                  fontSize: 10,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          //category
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xff802c6e)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.sell_rounded,
                    color: Color(0xff802c6e),
                    size: 10,
                  ),
                  Text(
                    '${product.category ?? ""}',
                    style: TextStyle(
                      fontFamily: 'Poppins Regular',
                      color: Color(0xff802c6e),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Button edit hapus
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xffFFD700),
                      onPressed: () {
                        Get.toNamed(Routes.FORM, arguments: product);
                      },
                      child: Icon(
                        Icons.mode_edit,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xffCA2023),
                      onPressed: () {
                        Get.dialog(
                          Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF2D2EB),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 10),
                                          child: Image.asset(
                                            'assets/images/tanyaLogo.png',
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 17),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: Text(
                                          'Are you sure?',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xff802c6e),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: Text(
                                          'Do you really want to delete this product? You will not be able to undo this action!',
                                          style: TextStyle(
                                            fontFamily: 'Poppins Regular',
                                            color: Color(0xff802c6e),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      ButtonBar(
                                        alignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              side: BorderSide(
                                                color: Color(0xff802c6e),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              fixedSize: Size(100, 15),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                fontFamily: 'Poppins Regular',
                                                color: Color(0xff802c6e),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff802c6e),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              fixedSize: Size(100, 15),
                                            ),
                                            onPressed: () {
                                              controller.deleteProduct(product);
                                              Get.back();
                                            },
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                fontFamily: 'Poppins Regular',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
