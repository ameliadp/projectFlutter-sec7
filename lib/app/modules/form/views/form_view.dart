import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';

import 'package:image_picker/image_picker.dart';

class FormView extends GetView<FormController> {
  final FormController formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    final items = [
      'Cardigan Vest',
      'Women Pants',
      'Women Top',
      'Blazer',
      'Dress',
      'Skirt',
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
              controller.addImage.value != ''
                  ? Container(
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
                    ),
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
                  await formController.getImage();
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
                        TextField(
                          controller: TextEditingController(),
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: formController.selectedValue.value,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                    color: Color(0xff802c6e),
                                  )),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            if (value != null) {
                              formController.setSelectedValue(value);
                            }
                          },
                          hint: Text('Category'),
                          itemHeight: 50,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: TextEditingController(),
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
                        TextField(
                          controller: TextEditingController(),
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
                  onPressed: () {},
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
