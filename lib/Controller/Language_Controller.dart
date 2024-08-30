import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LanguageTranslatorController extends GetxController {
  var originLanguage = 'From'.obs;
  var destinationLanguage = 'To'.obs;
  var output = ''.obs;
  TextEditingController languageController = TextEditingController();
  var languages = [
    'Hindi',
    'English',
    'Malayalam',
    'Tamil',
    'Telugu',
    'Kannada',
    'Marathi',
    'Arabic',
    'Urdu',
    'Sanskrit',
    'Spanish',
    'French',
    'German'
  ];

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    if (src == '--' || dest == '--') {
      output.value = "Fail to translate";
      return;
    }
    var translation = await translator.translate(input, from: src, to: dest);
    output.value = translation.text.toString();
  }

  String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Hindi':
        return 'hi';
      case 'Marathi':
        return 'mr';
      case 'Malayalam':
        return 'ml';
      case 'Tamil':
        return 'ta';
      case 'Telugu':
        return 'te';
      case 'Kannada':
        return 'kn';
      case 'Arabic':
        return 'ar';
      case 'Spanish':
        return 'es';
      case 'French':
        return 'fr';
      case 'German':
        return 'de';
      case 'Urdu':
        return 'ur';
      case 'Sanskrit':
        return 'sa';
      default:
        return '--';
    }
  }
}