import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_test/controllers/palindromeController.dart';
import 'package:suitmedia_test/views/secondScreen.dart';


// ignore: must_be_immutable
class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final nameController = TextEditingController();
  final palindromeController = Get.put(PalindromeController());
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/screen1_bg.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_photo.png',
              ),
              const SizedBox(
                height: 51,
              ),
              Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: GoogleFonts.poppins(
                            color: const Color(0xFFB3B3B3),
                          )),
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: palindromeController.textContoller.value,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Palindrome',
                          hintStyle: GoogleFonts.poppins(
                            color: const Color(0xFFB3B3B3),
                          )),
                    ),
                  )),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  palindromeController.checkPalindromeAction();
                  name = nameController.text;
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0XFF2B637B)),
                  minimumSize:
                      const MaterialStatePropertyAll(Size(double.infinity, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'CHECK',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (palindromeController.textContoller.value.text.isEmpty &&
                      name.isEmpty) {
                    Get.snackbar('Error', 'Please input name and palindrome',
                        snackPosition: SnackPosition.BOTTOM,
                        snackStyle: SnackStyle.FLOATING);
                    return;
                  } else {
                    Get.to(() => const SecondScreen(), arguments: name);
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0XFF2B637B)),
                  minimumSize:
                      const MaterialStatePropertyAll(Size(double.infinity, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'NEXT',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
