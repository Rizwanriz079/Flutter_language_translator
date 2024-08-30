import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/Language_Controller.dart';

class LanguageTranslator extends StatelessWidget {
  final LanguageTranslatorController controller = Get.put(LanguageTranslatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10223d),
      appBar: AppBar(
        title: Text("Language Translator",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      controller.originLanguage.value,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: controller.languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      controller.originLanguage.value = value!;
                    },
                  )),
                  SizedBox(width: 40),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.white, size: 40),
                  SizedBox(width: 40),
                  Obx(() => DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      controller.destinationLanguage.value,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: controller.languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      controller.destinationLanguage.value = value!;
                    },
                  )),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Please enter your text here...',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: controller.languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2b3c5a)),
                    onPressed: () {
                      controller.translate(
                        controller.getLanguageCode(controller.originLanguage.value),
                        controller.getLanguageCode(controller.destinationLanguage.value),
                        controller.languageController.text.toString(),
                      );
                    },
                    child: Text('Translate',style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height: 20),
              Obx(() => Text(
                '\n${controller.output.value}',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ))
            ],
          ),
        ),
      ),
    );
  }
}