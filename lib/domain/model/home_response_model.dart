import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

class HomeResponseModel {
  HomeResponseModel({
    required this.data,
  });

  List<HomeData> data;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        data:
        List<HomeData>.from(json["data"].map((x) => HomeData.fromJson(x))),
      );
}

class HomeData {
  HomeData({
    required this.section,
    required this.sectionTitle,
    required this.items,
  });

  String? section;
  String? sectionTitle;
  List<Item> items;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    section: json["section"] ?? '-',
    sectionTitle: json["section_title"] ?? '-',
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );
}

class Item {
  Item({
    this.articleTitle,
    this.articleImage,
    required this.link,
    this.productName,
    this.productImage,
  });

  String? articleTitle;
  String? articleImage;
  String link;
  String? productName;
  String? productImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    articleTitle: json["article_title"] ?? '-',
    articleImage: json["article_image"] ?? '-',
    link: json["link"],
    productName: json["product_name"] ?? '-',
    productImage: json["product_image"] ?? '-',
  );
}
