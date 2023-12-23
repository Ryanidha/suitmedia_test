// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PalindromeController extends GetxController {
  final name = ''.obs;
  final textContoller = TextEditingController().obs;
  final isPalindrome = false.obs;
  
  bool checkPalindrome(String text) {
    final textLength = text.length;
    for (var i = 0; i < textLength / 2; i++) {
      if (text[i] != text[textLength - i - 1]) {
        return false;
      }
    }
    return true;
  }

void showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Get.back();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Palindrome"),
    content: Obx(() => Text(
          isPalindrome.value
              ? '${textContoller.value.text} is Palindrome'
              : '${textContoller.value.text} is not Palindrome',
          style: const TextStyle(fontSize: 20),
        )),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  void checkPalindromeAction() {
    isPalindrome.value = checkPalindrome(textContoller.value.text);
    showAlertDialog(Get.context!);
  }

}