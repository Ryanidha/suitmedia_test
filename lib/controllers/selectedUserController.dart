import 'package:get/get.dart';

class SelectedUserController extends GetxController{
  String? SelectedUser;

  // ignore: non_constant_identifier_names
  void SetSelectedUser(String? firstName, String? lastName){
    SelectedUser = '$firstName $lastName';
    update();
  }
}