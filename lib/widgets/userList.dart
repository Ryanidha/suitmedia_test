import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserList extends StatelessWidget {
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;

  UserList({super.key, this.firstName, this.lastName, this.email, this.avatar});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE2E3E4),
            width: 1.0,
          ),
        ),
      ),
      width: sw,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(avatar.toString()),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$firstName $lastName',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                email.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
