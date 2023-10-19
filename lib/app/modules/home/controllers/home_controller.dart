import 'package:get/get.dart';
import 'package:project_sec7/main.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    products.addAll([
      Product(
        id: 1,
        title: 'DORE HW PANTS / HIGHWAIST PANTS / CELANA PANJANG WANITA',
        price: 99.45,
        description:
            'Another seasonless piece for you. Featuring high-waisted fit in loose fit.\nSIZE DETAILS\nSize S\nWaist 66 cm | Hip 88 cm | Length 114 cm\nSize M\nWaist 70 cm | Hip 92 cm | Length 116 cm\nSize L\nWaist 74 cm | Hip 96 cm | Length 118 cm',
        category: 'Womens Pants',
        image: 'assets/images/product1.png',
        rating: Rating(rate: 4.5, count: 300),
      ),
      Product(
        id: 2,
        title:
            'Women Boho Swiss Dot Maxi Dresses Wrap V Neck Flutter Short Sleeve Solid Tie Waist A Line Tiered Flowy Long Dresses',
        price: 101.99,
        description:
            'Maxi Dress for Women is Made of Premium Durable Polyester Fabric,Loose fit and Comfortable Long Dresses with Elastic Waist,Flattering On All Body Types. Non-stretch Fabric,Machine-washable.',
        category: 'Dress',
        image: 'assets/images/product2.png',
        rating: Rating(rate: 4.0, count: 250),
      ),
      Product(
        id: 3,
        title: 'NANUSHKA AMAS SKIRT CREME',
        price: 545.00,
        description:
            'The Amas skirt is crafted from creme OKOBOR™ for a flattering wrap silhouette. Its finished with a concealed side button, elasticated waist and tie front for comfort and functionality.',
        category: 'Skirt',
        image: 'assets/images/product3.png',
        rating: Rating(rate: 4.8, count: 285),
      ),
      Product(
        id: 4,
        title: 'HERA CORSET TOP SHIRT LONGSLEEVE',
        price: 350.28,
        description:
            'Lantern sleeve shirt with buttons on the front. This top suitable for beautifying your outfit',
        category: 'Womens Top',
        image: 'assets/images/product4.png',
        rating: Rating(rate: 4.0, count: 150),
      ),
      Product(
        id: 5,
        title: 'Max Mara Lambro Blazer in Ivory',
        price: 580.00,
        description:
            'The wrap tie waist – creating a soft, slouched drape through the body – brings a contemporary tone to the tailored silhouette of Max Maras ivory Lambro blazer. Its impeccably constructed in Italy from crepe with silk-satin notch lapels that coordinate with the lustrous lining which assures a clean drape. Try styling it with the corresponding trousers and muted sandals for a lunch appointment.',
        category: 'Blazer',
        image: 'assets/images/product5.png',
        rating: Rating(rate: 4.2, count: 100),
      ),
      Product(
        id: 6,
        title: 'Vest Knit Cardigan',
        price: 325.00,
        description:
            'Premium button knit vest. Made with quality materials, soft and elastic knit texture, suitable for beautifying your outfit. For all sizes.',
        category: 'Cardigan Vest',
        image: 'assets/images/product6.png',
        rating: Rating(rate: 4.5, count: 395),
      ),
    ]);
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

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.count,
    this.rate,
  });
}
