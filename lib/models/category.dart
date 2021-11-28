import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = AppColors.tileOfGrid,
  });
}
