import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String title;
  final  String description;
  final Timestamp createdAt;
  final String color;

  Note(this.id,this.title, this.description, this.color, this.createdAt);

  // Factory method to create a Note instance from a JSON map
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
      json['color'] as String,
      json['createdAt'] as Timestamp,
    );
  }

  // Convert a Note instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'title': title,
      'description': description,
      'color': color,
      'createdAt': createdAt,
    };
  }
}
