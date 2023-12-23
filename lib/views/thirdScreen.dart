import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/controllers/paginationController.dart';
import 'package:suitmedia_test/models/repository.dart';
import 'package:suitmedia_test/widgets/userList.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({super.key});
  final data = Get.arguments;
  final PaginationController paginationController =
      Get.put(PaginationController(Repository(Dio())));

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Third Screen',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await paginationController.refreshUsers();
          },
          child: Obx(() {
            final users = paginationController.users;

            if (users.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return GestureDetector(
                    onTap: () {
                      Get.back(result: [
                        data[0],
                        user.first_name,
                        user.last_name,
                        user.email,
                        user.avatar
                      ]);
                    },
                    child: UserList(
                        firstName: user.first_name,
                        lastName: user.last_name,
                        email: user.email,
                        avatar: user.avatar),
                  );
                });
          }),
        ),
      ),
    );
  }
}
