import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/model/user_model.dart';
import 'package:users_app/view/home/details_screen.dart';
import 'package:users_app/widgets/text_widget.dart';
import 'package:users_app/view/home/home_widgets.dart';
import 'package:users_app/controller/user_provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     final userProvider = Provider.of<UserProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: const Color(0xFF00246B),
//           toolbarHeight: size.height * .14,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               poppinsText(
//                 text: 'HOME',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               searchTextField(
//                 context,
//                 onChanged: (value) =>
//                     userProvider.search(userProvider.searchController.text),
//               )
//             ],
//           )),
//       body: FutureBuilder<List<UserModel>>(
//         future: userProvider.getUsers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: poppinsText(text: 'Something Went Wrong Please Reload'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: poppinsText(text: 'No Data Available'),
//             );
//           } else {

//             final users = snapshot.data!;
//             return RefreshIndicator(
//               onRefresh: userProvider.getUsers(),
//               child: ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         vertical: size.height * .002,
//                         horizontal: size.width * .01),
//                     child: Card(
//                       elevation: 5,
//                       color: const Color.fromARGB(255, 237, 238, 242),
//                       child: ListTile(
//                           title: Text(user.name ?? 'No name'),
//                           subtitle: Text(user.email ?? 'No email'),
//                           trailing: IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => UserDetailsScreen(
//                                             size: size,
//                                             user: user,
//                                           )));
//                             },
//                             icon: const Icon(
//                               Icons.arrow_forward_ios_outlined,
//                               color: Color(0xFF00246B),
//                             ),
//                           )),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF00246B),
          toolbarHeight: size.height * .14,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              poppinsText(
                text: 'HOME',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              searchTextField(
                context,
                onChanged: (value) =>
                    userProvider.search(userProvider.searchController.text),
              )
            ],
          )),
      body: FutureBuilder<List<UserModel>>(
        future: userProvider.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
                child:
                    poppinsText(text: 'Something Went Wrong. Please Reload.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: poppinsText(text: 'No Data Available'),
            );
          } else {
            return Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final users = userProvider.searchList.isNotEmpty ||
                        userProvider.searchController.text.isNotEmpty
                    ? userProvider.searchList
                    : snapshot.data!;

                return RefreshIndicator(
                  onRefresh: userProvider.refreshUsers,
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * .002,
                            horizontal: size.width * .01),
                        child: Card(
                          elevation: 5,
                          color: const Color.fromARGB(255, 237, 238, 242),
                          child: ListTile(
                            title: Text(user.name ?? 'No name'),
                            subtitle: Text(user.email ?? 'No email'),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserDetailsScreen(
                                              size: size,
                                              user: user,
                                            )));
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color(0xFF00246B),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
