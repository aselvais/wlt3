import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
class ItemModel {

  final int id;
  final String name;
  final Color color;
  final int price = 42;

  ItemModel(this.id, this.name) : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is ItemModel && other.id == id;
  
}
