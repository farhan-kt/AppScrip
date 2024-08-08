import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:users_app/model/user_model.dart';
import 'package:users_app/service/user_service.dart';

// class UserProvider extends ChangeNotifier {
//   List<UserModel> usersList = [];
//   List<UserModel> searchList = [];

//   UserService userService = UserService();

//   TextEditingController searchController = TextEditingController();

//   Future<List<UserModel>> getUsers() async {
//     try {
//       usersList = await userService.getData();
//       notifyListeners();
//       return usersList;
//     } catch (e) {
//       log('Error in UserProvider: $e');
//       rethrow;
//     }
//   }

//   void search(String value) {
//     if (value.isEmpty) {
//       searchList = usersList;
//     } else {
//       searchList = usersList
//           .where((UserModel user) =>
//               user.name!.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }

class UserProvider extends ChangeNotifier {
  List<UserModel> usersList = [];
  List<UserModel> searchList = [];

  UserService userService = UserService();

  TextEditingController searchController = TextEditingController();

  Future<List<UserModel>> getUsers() async {
    try {
      usersList = await userService.getData();
      searchList = usersList;
      notifyListeners();
      return usersList;
    } catch (e) {
      log('Error in UserProvider: $e');
      rethrow;
    }
  }

  Future<void> refreshUsers() async {
    try {
      usersList = await userService.getData();
      search(searchController.text); // Maintain search results after refresh
      notifyListeners();
    } catch (e) {
      log('Error in refreshing users: $e');
      rethrow;
    }
  }

  void search(String value) {
    if (value.isEmpty) {
      searchList = usersList;
    } else {
      searchList = usersList
          .where((UserModel user) =>
              user.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
