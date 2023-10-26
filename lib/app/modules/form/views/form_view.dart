import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_sec7/app/data/product_model.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  final GlobalKey<FormState> formkey = GlobalKey();
  Product product = Get.arguments ?? Product();

  @override
  Widget build(BuildContext context) {
    controller.modelToController(product);

    final items = [
      'electronics',
      'jewelery',
      "men's clothing",
      "women's clothing",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        backgroundColor: Colors.white,
        //Logo & Title
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
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              //add image
              product.image != null
                  ? Container(
                      margin: EdgeInsets.all(20),
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
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Image.network(product.image ?? '',
                            fit: BoxFit.contain),
                      ),
                    )
                  : (controller.addImage.value.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.all(20),
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
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.file(File(controller.addImage.value),
                                fit: BoxFit.contain),
                          ),
                        )
                      :
                      //image kotak
                      Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          height: 200,
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
                          child: Image.asset(
                            'assets/images/addPhoto.png',
                            width: 200,
                            height: 200,
                          ),
                        )),
              SizedBox(height: 5),
              //add image button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 30),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Color(0xff802c6e),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  await controller.getImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        fontFamily: 'Poppins Regular',
                        color: Color(0xff802c6e),
                        fontSize: 13,
                      ),
                    ),
                    Icon(
                      Icons.image,
                      color: Color(0xff802c6e),
                      size: 19,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              //Form
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Product Information',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: controller.titleC,
                          validator: ((value) => value == null || value == ''
                              ? 'This field is required'
                              : null),
                          autocorrect: false,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: 'Product Name',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins Regular',
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff802c6e)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                          isDense: true,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xfff5f5f5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff802c6e),
                              ),
                            ),
                          ),
                          value: controller.selectedValue.value.isNotEmpty
                              ? controller.selectedValue.value
                              : null,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Color(0xff802c6e),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            if (value != null) {
                              controller.setSelectedValue(value);
                            }
                          },
                          hint: Text('Category'),
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                          isExpanded: true,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: controller.priceC,
                          validator: ((value) => value == null || value == ''
                              ? 'This field is required'
                              : controller.checkIsDouble(value) == false
                                  ? 'Wrong Value'
                                  : null),
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: 'Price',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins Regular',
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff802c6e)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: controller.descriptionC,
                          autocorrect: false,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins Regular',
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff802c6e)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Button Submit
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff802c6e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    formkey.currentState?.validate() == true
                        ? await controller.storeProduct(
                            product, (product.id != null) ? true : false)
                        : Get.snackbar('Error', 'Data tidak valid');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontFamily: 'Poppins Medium',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
