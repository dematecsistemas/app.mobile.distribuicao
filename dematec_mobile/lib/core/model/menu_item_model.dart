import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Color? iconColor;
  final String route;

  MenuItemModel({
    required this.title,
    required this.subtitle,
    this.icon,
    this.iconColor,
    required this.route,
  });
}
