import 'package:flutter/material.dart';

class Group {
  String id;
  String name;
  String description;
  Color color;
  IconData icon;
  DateTime? createdAt;

  Group({
    required String id,
    this.name = "New Group",
    this.description = "New Group Description",
    this.color = Colors.black,
    this.icon = Icons.group,
    DateTime? createdAt,
  })  : id = id.isNotEmpty ? id : UniqueKey().toString(),
        createdAt = createdAt ?? DateTime.now();

  factory Group.fromJson(Map<String, dynamic> json) {
    IconData getIconData(int codePoint) {
      switch (codePoint) {
        case 0xe7f4:
          return Icons.group;
        case 0xe156:
          return Icons.access_alarm;
        case 0xe03e:
          return Icons.add;
        // Add more cases here...
        default:
          return Icons
              .error; // Return a default icon if the codePoint is not found
      }
    }

    return Group(
      id: json['id'] as String,
      name: json['name'] ?? "New Group",
      description: json['description'] ?? "New Group Description",
      color: Color(json['color'] as int),
      icon: getIconData(json['icon'] as int),
      createdAt: json.containsKey('createdAt')
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.isNotEmpty ? id : UniqueKey().toString(),
      'name': name,
      'description': description,
      'color': color.value,
      'icon': icon.codePoint,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
