import 'package:flutter/material.dart';

class CreateTaskDetails {
  final String taskName;
  final String date;
  final String time;
  final String details;

  CreateTaskDetails({
    required this.taskName,
    required this.date,
    required this.time,
    required this.details,
  });
}

class CreateTaskProvider with ChangeNotifier {
  final List<CreateTaskDetails> _taskDetails = [];
  List<CreateTaskDetails> get taskDetails => _taskDetails;
  void addTaskDetails(String name, String date, String time, String details) {
    _taskDetails.add(
      CreateTaskDetails(
        taskName: name,
        date: date,
        time: time,
        details: details,
      ),
    );
    notifyListeners();
  }
}
