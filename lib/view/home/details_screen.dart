import 'package:flutter/material.dart';
import 'package:users_app/model/user_model.dart';
import 'package:users_app/view/home/home_widgets.dart';
import 'package:users_app/widgets/text_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  final Size size;
  final UserModel user;
  const UserDetailsScreen({super.key, required this.size, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF00246B),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: poppinsText(
              text: user.name,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * .02,
            ),
            userDetailsScreenValues(context,
                titleText: 'User Name', valueText: user.userName),
            SizedBox(
              height: size.height * .02,
            ),
            userDetailsScreenValues(context,
                titleText: 'Email', valueText: user.email),
            SizedBox(
              height: size.height * .02,
            ),
            userDetailsScreenValues(context,
                titleText: 'Phone', valueText: user.phone),
            SizedBox(
              height: size.height * .02,
            ),
            userDetailsScreenAddress(user: user),
            SizedBox(
              height: size.height * .02,
            ),
            userDetailsScreenValues(context,
                titleText: 'Website', valueText: user.website),
            SizedBox(
              height: size.height * .02,
            ),
          ],
        ));
  }
}
