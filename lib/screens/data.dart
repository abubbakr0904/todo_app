import 'dart:ui';
import 'package:hive/hive.dart';

import '../data/model/category_model/category_model.dart';
import '../utils/images/images.dart';

List<CategoryModel> dataBases = [
  CategoryModel(
    icon: AppImages.grPlus,
    color: const Color(0xFF80FFD1),
    category: "New category",
  ),
  CategoryModel(
    icon: AppImages.bread,
    color: const Color(0xFFCCFF80),
    category: "Grocery",
  ),
  CategoryModel(
    icon: AppImages.workBag,
    color: const Color(0xFFFF9680),
    category: "Work",
  ),
  CategoryModel(
    icon: AppImages.gantel,
    color: const Color(0xFF80FFFF),
    category: "Sport",
  ),
  CategoryModel(
    icon: AppImages.playstation,
    color: const Color(0xFF80FFD9),
    category: "Design",
  ),
  CategoryModel(
    icon: AppImages.studentCap,
    color: const Color(0xFF809CFF),
    category: "University",
  ),
  CategoryModel(
    icon: AppImages.macroPhone,
    color: const Color(0xFFFF80EB),
    category: "Social",
  ),
  CategoryModel(
    icon: AppImages.music,
    color: const Color(0xFFFC80FF),
    category: "Music",
  ),
  CategoryModel(
    icon: AppImages.puls,
    color: const Color(0xFF80FFA3),
    category: "Health",
  ),
  CategoryModel(
    icon: AppImages.video,
    color: const Color(0xFF80D1FF),
    category: "Movie",
  ),
  CategoryModel(
    icon: AppImages.homeScreen,
    color: const Color(0xFFFFCC80),
    category: "Home",
  ),

];


var box = Hive.box("myBox");