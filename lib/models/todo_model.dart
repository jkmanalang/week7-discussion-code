/*
  Created by: Claizel Coubeili Cepe
  Date: 27 October 2022
  Description: Sample todo app with networking
*/
import 'dart:convert';

class Todo {
  final int userId;
  String? id; // Nullable
  String title;
  bool completed;

  Todo({
    required this.userId,
    this.id,
    required this.title,
    required this.completed,
  });

  // another way to declare constructor. just like method that take a value and return a constructor. applicable when diff format instantiation
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      // json in dart
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  // parse the list of json
  static List<Todo> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Todo>((dynamic d) => Todo.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Todo todo) {
    return {
      'userId': todo.userId,
      'title': todo.title,
      'completed': todo.completed,
    };
  }
}
