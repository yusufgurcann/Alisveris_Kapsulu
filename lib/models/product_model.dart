import 'package:uuid/uuid.dart';

class ProductModel {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });

  static List<ProductModel> products = [
    ProductModel(
      //1
      productId: "iphone14-128- uzay siyah",
      productTitle: "Apple İphone 14 Pro (128GB) - Uzay Siyahı",
      productPrice: "299.99",
      productCategory: "Phones",
      productDescription: "6.1-inch magical way to interact with your mode, Accident detection, vital safety features.",
      productImage: "https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp",
      productQuantity: "10",
    ),
    ProductModel(
      //2
      productId: "İphone13-256-black",
      productTitle: "Apple İphone 13 (256GB) - Gece Yarısı",
      productPrice: "279.99",
      productCategory: "Phones",
      productDescription: "6.2-inch dynamic AMOLED display, Triple-camera system, 8K video recording.",
      productImage: "https://i.ibb.co/w6yXzXL/2-galaxy-s21-128gb-white.webp",
      productQuantity: "15",
    ),
    ProductModel(
      //3
      productId: "pixel6-128-black",
      productTitle: "Google Pixel 6 (128GB) - Black",
      productPrice: "249.99",
      productCategory: "Phones",
      productDescription: "6.4-inch smooth display, Google's custom Tensor processor, Advanced AI features.",
      productImage: "https://i.ibb.co/RHScfP8/3-pixel6-128gb-black.webp",
      productQuantity: "20",
    ),
    ProductModel(
      //4
      productId: "galaxyS21-128-white",
      productTitle: "Samsung Galaxy S21 (128GB) - White",
      productPrice: "259.99",
      productCategory: "Phones",
      productDescription: "6.55-inch Fluid AMOLED display, Hasselblad camera for mobile, Warp Charge 65T.",
      productImage: "https://i.ibb.co/Qrk1Nvn/4-oneplus9-128gb-blue.webp",
      productQuantity: "12",
    ),
    ProductModel(
      //5
      productId: "xiaomi11-256-gray",
      productTitle: "Xiaomi Mi 11 (256GB) - Gray",
      productPrice: "269.99",
      productCategory: "Phones",
      productDescription: "6.81-inch AMOLED display, Snapdragon 888, 108MP triple camera.",
      productImage: "https://i.ibb.co/WpdNm8h/5-xiaomi-mi11-256gb-gray.webp",
      productQuantity: "18",
    ),
    ProductModel(
      //6
      productId: "sonyXperia5-128-black",
      productTitle: "Sony Xperia 5 II (128GB) - Black",
      productPrice: "279.99",
      productCategory: "Phones",
      productDescription: "6.1-inch OLED display, Triple camera system with ZEISS optics, 120Hz refresh rate.",
      productImage: "https://i.ibb.co/YDkKs4L/6-sony-xperia5-128gb-black.webp",
      productQuantity: "14",
    ),
    ProductModel(
      //7
      productId: "huaweiP40-128-silver",
      productTitle: "Huawei P40 Pro (128GB) - Silver",
      productPrice: "289.99",
      productCategory: "Phones",
      productDescription: "6.58-inch OLED display, Kirin 990 5G, Ultra Vision Leica Quad Camera.",
      productImage: "https://i.ibb.co/5jYBPZW/7-huawei-p40-128gb-silver.webp",
      productQuantity: "16",
    ),
    ProductModel(
      //8
      productId: "oppoFindX3-256-black",
      productTitle: "Oppo Find X3 Pro (256GB) - Black",
      productPrice: "299.99",
      productCategory: "Phones",
      productDescription: "6.7-inch AMOLED display, Snapdragon 888, Quad camera system.",
      productImage: "https://i.ibb.co/3N0MN0H/8-oppo-find-x3-256gb-black.webp",
      productQuantity: "10",
    ),
    ProductModel(
      //9
      productId: "lgWing-128-blue",
      productTitle: "LG Wing (128GB) - Blue",
      productPrice: "279.99",
      productCategory: "Phones",
      productDescription: "6.8-inch P-OLED display, Swivel screen, Snapdragon 765G.",
      productImage: "https://i.ibb.co/YtxKPLN/9-lg-wing-128gb-blue.webp",
      productQuantity: "7",
    ),
    ProductModel(
      //10
      productId: "nokia8-128-gray",
      productTitle: "Nokia 8.3 (128GB) - Gray",
      productPrice: "249.99",
      productCategory: "Phones",
      productDescription: "6.81-inch IPS LCD, Snapdragon 765G, Quad camera system.",
      productImage: "https://i.ibb.co/7JMgbFy/10-nokia8-128gb-gray.webp",
      productQuantity: "20",
    ),
  ];
}
