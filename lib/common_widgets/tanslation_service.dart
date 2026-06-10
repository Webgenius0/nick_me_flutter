import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// step 03

class TranslationService extends Translations {
  // Default language
  static final fallbackLocale = Locale('en', 'US'); // Fallback language

  // Load translations from JSON files
  static Future<Map<String, Map<String, String>>> loadTranslations() async {
    Map<String, Map<String, String>> translations = {};

    // Load English JSON file
    final enData = await rootBundle.loadString('assets/translations/en.json');
    translations['en_US'] = Map<String, String>.from(json.decode(enData));

    // Load Spanish JSON file
    final frData = await rootBundle.loadString('assets/translations/fr.json');
    translations['fr_FR'] = Map<String, String>.from(json.decode(frData));

    return translations;
  }

  @override
  Map<String, Map<String, String>> get keys => translationsMap;

  static Map<String, Map<String, String>> translationsMap = {};

  // Initialize translations map
  static Future<void> init() async {
    translationsMap = await loadTranslations();
  }
}
