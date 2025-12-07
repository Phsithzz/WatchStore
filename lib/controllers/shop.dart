import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Louis Vuitton Escale",
      price: 1390000.00,
      description:
          "นาฬิการุ่น Escale ระบบอัตโนมัติ 39 มม. แพลทินัม โดดเด่นด้วยรายละเอียดประณีตซับซ้อนที่สะท้อนถึงการตกแต่งบนทรังก์อันเป็นเอกลักษณ์ของเมซง ",
      imagePath: "assets/images/product_one.jpg",
    ),
    Product(
      name: "Gucci Dive watch",
      price: 91000.00,
      description:
          "Gucci Dive ยังคงนำเสนอสัญลักษณ์ของแบรนด์ในรูปแบบร่วมสมัยอย่างต่อเนื่อง นาฬิกาเรือนนี้ขับเคลื่อนด้วยกลไกอัตโนมัติ ",
      imagePath: "assets/images/product_two.jpg",
    ),
    Product(
      name: "Rolex Datejust",
      price: 351500.00,
      description:
          "ประวัติศาสตร์ของการผลิตนาฬิกาในฐานะที่เป็นนาฬิกาข้อมือโครโนมิเตอร์เรือนแรกที่มาพร้อมคุณสมบัติกันน้ำและระบบขึ้นลานอัตโนมัติ ",
      imagePath: "assets/images/product_three.jpg",
    ),
    Product(
      name: "Garmin fenix 8 ",
      price: 36990.00,
      description:
          "นาฬิกาสมาร์ทวอทช์รุ่นใหม่ ที่มาพร้อมดีไซน์ที่โดดเด่นและน่าค้นหา หน้าจอ AMOLED ขนาด 1.4 นิ้ว ได้รับการออกแบบมาเพื่อสายรักสุขภาพตอบโจทย์ทุกการใช้งาน ",
      imagePath: "assets/images/product_four.png",
    ),
  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
