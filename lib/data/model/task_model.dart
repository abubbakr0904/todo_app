import 'dart:ui';

import 'package:todo_app/data/model/task_model_constans.dart';
import 'package:todo_app/data/model/task_status.dart';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String category;
  final DateTime deadline;
  final int priority;
  final TaskStatus status;
  final String categoryIcon;
  final int categoryColor;

  TaskModel({
    this.id,
    required this.description,
    required this.title,
    required this.status,
    required this.category,
    required this.deadline,
    required this.priority,
    required this.categoryIcon,
    required this.categoryColor,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    DateTime? deadline,
    int? priority,
    TaskStatus? status,
    String? categoryIcon,
    Color? categoryColor,
  }) {
    return TaskModel(
      description: description ?? this.description,
      title: title ?? this.title,
      status: status ?? this.status,
      category: category ?? this.category,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      categoryColor: categoryColor?.value ?? this.categoryColor,
      categoryIcon: categoryIcon ?? this.categoryIcon
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      description: json["description"] as String? ?? "",
      title: json["title"] as String? ?? "",
      status: getStatus(json["status"] as String? ?? ""),
      category: json["category"] as String? ?? "",
      deadline: DateTime.parse(json["deadline"] as String? ?? ""),
      priority: json["priority"] as int? ?? 1,
      categoryIcon: json["icon"] ?? "",
      categoryColor: json["color"] ?? 1,
      id: json["_id"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TaskModelConstants.description: description,
      TaskModelConstants.title: title,
      TaskModelConstants.status: status.name,
      TaskModelConstants.category: category,
      TaskModelConstants.deadline: deadline.toString(),
      TaskModelConstants.priority: priority,
      TaskModelConstants.icon : categoryIcon,
      TaskModelConstants.color : categoryColor,
    };
  }


  String getString(){
    return """
    ${this.category},
    ${this.priority},
    ${this.categoryIcon},
    ${this.deadline.hour},
    ${this.deadline.minute},
    ${this.title},
    ${this.categoryColor},
    ${this.status},
    
    
    """;
  }
  bool canAddTaskToDatabase() {
    if (title.isEmpty) return false;
    if (description.isEmpty) return false;
    if (category.isEmpty) return false;
    if (priority == 0) return false;
    return true;
  }

  static TaskModel initialValue = TaskModel(
    description: "",
    title: "",
    status: TaskStatus.processing,
    category: "",
    deadline: DateTime.now(),
    priority: 1,
    categoryColor: 0,
    categoryIcon: ""
  );
}

TaskStatus getStatus(String statusText) {
  switch (statusText) {
    case "processing":
      {
        return TaskStatus.processing;
      }
    case "done":
      {
        return TaskStatus.done;
      }
    case "canceled":
      {
        return TaskStatus.cancelled;
      }
    default:
      {
        return TaskStatus.missed;
      }
  }
}

