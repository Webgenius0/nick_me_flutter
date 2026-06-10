import 'package:flutter/widgets.dart';

class TastingDetails {
  final String tastingName;
  final String tastingDetails;
  // final String tastingList;
  List<String> tastingList = [];

  TastingDetails({
    required this.tastingName,
    required this.tastingDetails,
    required this.tastingList,
  });
}

class TastingDetailsProvider with ChangeNotifier {
  final List<TastingDetails> _tastingDetails = [];
  List<TastingDetails> get tastingDetails => _tastingDetails;
  void addTastingDetails(
    String name,
    String details,
    List<String> tastingList,
  ) {
    _tastingDetails.add(
      TastingDetails(
        tastingName: name,
        tastingDetails: details,
        tastingList: tastingList,
      ),
    );
    notifyListeners();
  }
}
