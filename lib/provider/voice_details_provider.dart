import 'package:flutter/widgets.dart';

class VoiceDetails {
  final String voiceTittle;
  final String voiceDesc;
  final String voiceFile;
  final String voiceDate;
  VoiceDetails({
    required this.voiceTittle,
    required this.voiceDesc,
    required this.voiceFile,
    required this.voiceDate,
  });
}

class VoiceDetailsProvider with ChangeNotifier {
  final List<VoiceDetails> _voiceDetails = [];
  List<VoiceDetails> get voiceDetails => _voiceDetails;
  void addVoiceDetails(String tittle, String desc, String file, String date) {
    _voiceDetails.add(
      VoiceDetails(
        voiceTittle: tittle,
        voiceDesc: desc,
        voiceFile: file,
        voiceDate: date,
      ),
    );
    notifyListeners();
  }
}
