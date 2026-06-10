import 'package:flutter/material.dart';

class MeetingDetails {
  final String name;
  final String meetingDescription;
  final String date;
  final String time;
  final String setReminder;
  final String location;
  MeetingDetails({
    required this.name,
    required this.meetingDescription,
    required this.date,
    required this.time,
    required this.location,
    required this.setReminder,
  });
}

class MeetingDetailsProvider with ChangeNotifier {
  final List<MeetingDetails> _meetingDetails = [];
  List<MeetingDetails> get meetingDetails => _meetingDetails;
  void addMeetingDetails(
    String name,
    String meetingDescription,
    String date,
    String time,
    String location,
    String setReminder,
    bool remindEnabled,
  ) {
    _meetingDetails.add(
      MeetingDetails(
        name: name,
        meetingDescription: meetingDescription,
        date: date,
        time: time,
        location: location,
        setReminder: setReminder,
      ),
    );
    notifyListeners();
  }
}
