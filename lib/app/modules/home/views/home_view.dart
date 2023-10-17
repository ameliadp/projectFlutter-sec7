  import 'package:flutter/material.dart';

  import 'package:get/get.dart';

  import '../controllers/home_controller.dart';

  class HomeView extends GetView<HomeController> {
    final HomeController homeController = Get.put(HomeController());

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          //Logo&Title
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
                    color: Color(0xff802c6e)),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              //searchBar&Filter
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 230,
                    height: 50,
                    child: TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          labelText: 'Search Product',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins Light',
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff802c6e),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 100,
                    height: 50,
                    child: TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          labelText: 'Filter',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins Light',
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(Icons.filter_alt_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff802c6e),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  )
                ],
              ),
            ),
            //Card GridView
            Expanded(
                child: GridView.builder(
                  key: UniqueKey(),
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final product = homeController.products[index];

                return Container(
                  width: 100,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          product.image,
                          width: 100,
                          height: 145,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 7,left: 7),
                        child: Text(
                          product.title,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Poppins Bold',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 7,left: 7),
                        child: Text(
                          product.description,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Poppins Regular',
                            fontSize: 13,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 7,left: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                            
                                  Text(
                                    '${homeController.products[index].rating.rate.toString()}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
            //button Add Product
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(190, 40),
                    backgroundColor: Color(0xff802c6e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Add New Product',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
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
