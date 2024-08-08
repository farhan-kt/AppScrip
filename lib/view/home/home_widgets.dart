import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/model/user_model.dart';
import 'package:users_app/widgets/text_widget.dart';
import 'package:users_app/controller/user_provider.dart';

Widget searchTextField(context, {onChanged}) {
  return TextField(
    onChanged: onChanged,
    controller:
        Provider.of<UserProvider>(context, listen: false).searchController,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.search),
      hintText: 'Search',
      hintStyle: GoogleFonts.inter(
        color: const Color(0xFF98A3B3),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      fillColor: const Color.fromARGB(255, 225, 227, 234),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

// User Details Screen ListTile
Widget userDetailsScreenValues(context, {titleText, valueText}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        poppinsText(
            text: titleText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 131, 120, 120)),
        const SizedBox(
          height: 2,
        ),
        Container(
          height: size.height * .06,
          width: size.width * .9,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 238, 242),
            border: Border.all(
              color: const Color.fromARGB(255, 237, 238, 242),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: poppinsText(
            text: valueText,
            color: const Color(0xFF00246B),
          ),
        )
      ],
    ),
  );
}

//
Widget userDetailsScreenAddressListTile(
    {required titleText, required valueText}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: poppinsText(
              text: titleText,
              color: const Color(0xFF00246B),
            ),
          ),
          Expanded(
            flex: 1,
            child: poppinsText(
              text: ':',
              color: const Color(0xFF00246B),
            ),
          ),
          Expanded(
            flex: 5,
            child: poppinsText(
              text: valueText,
              color: const Color(0xFF00246B),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 2,
      ),
    ],
  );
}

Widget userDetailsScreenAddress({required UserModel user}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        poppinsText(
            text: 'Address',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 131, 120, 120)),
        const SizedBox(
          height: 2,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 238, 242),
            border: Border.all(
              color: const Color.fromARGB(255, 237, 238, 242),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              userDetailsScreenAddressListTile(
                titleText: 'Street',
                valueText: user.address?.street ?? 'unknown',
              ),
              userDetailsScreenAddressListTile(
                titleText: 'Suite',
                valueText: user.address?.suite ?? 'unknown',
              ),
              userDetailsScreenAddressListTile(
                titleText: 'City',
                valueText: user.address?.city ?? 'unknown',
              ),
              userDetailsScreenAddressListTile(
                  titleText: 'Zip Code',
                  valueText: user.address?.zipcode ?? 'unknown'),
              userDetailsScreenAddressListTile(
                  titleText: 'Lat',
                  valueText: user.address?.geo?.lat ?? 'unknown'),
              userDetailsScreenAddressListTile(
                  titleText: 'Lng',
                  valueText: user.address?.geo?.lng ?? 'unknown'),
            ],
          ),
        ),
      ],
    ),
  );
}
