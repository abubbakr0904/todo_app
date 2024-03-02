import 'dart:ui';

import 'package:todo_app/data/model/category_model/catigory_constans.dart';
import 'package:todo_app/data/model/task_model.dart';

class CategoryModel {
  final int? id;
  final String icon;
  final Color color;
  final String category;

  CategoryModel(
      {this.id , required this.color, required this.icon, required this.category});

  CategoryModel copyWith({
    int? id  ,
    Color? color,
    String? icon,
    String? category}) {
    return CategoryModel(
        color: color ?? const Color(0xFFFFFFFF),
        icon: icon ?? this.icon,
        category: category ?? this.category);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        color: Color(int.parse(json["color"] ?? "0xFFFFFFF")),
        icon: json["icon"] ?? "",
        category: json["category"] ?? "",
        id: json["_id"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryConstants.color: color.value.toString(),
      CategoryConstants.icon: icon,
      CategoryConstants.category: category,
    };
  }

  static CategoryModel initialValue =
      CategoryModel(color: const Color(0xFFFFFFFF), icon: "", category: "");
}
