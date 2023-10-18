import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';
import 'package:project_sec7/app/modules/home/controllers/home_controller.dart';

class DetailView extends GetView<DetailController> {
  final Product detailProduct;
  final List<Product>? products;

  DetailView({required this.detailProduct, this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            margin: EdgeInsets.all(20),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(
              detailProduct.image,
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 5),
          //title
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Text(
              detailProduct.title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          //rating
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xffffaa4a),
                  size: 15,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffffaa4a),
                  size: 15,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffffaa4a),
                  size: 15,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffffaa4a),
                  size: 15,
                ),
                Icon(
                  Icons.star_half,
                  color: Color(0xffffaa4a),
                  size: 15,
                ),
                SizedBox(width: 5),
                Text(
                  '${detailProduct.rating.rate.toStringAsFixed(1)} | ${detailProduct.rating.count}',
                  style: TextStyle(
                    fontFamily: 'Poppins Regular',
                    fontSize: 9,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          //price
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$${detailProduct.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 10),
          //description
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${detailProduct.description}',
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
              width: 80,
              height: 25,
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
                    '${detailProduct.category}',
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
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xffFFD700),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.mode_edit,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xffCA2023),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
