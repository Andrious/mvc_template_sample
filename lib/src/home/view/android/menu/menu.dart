///
/// Copyright (C) 2020 Andrious Solutions
///
/// This program is free software; you can redistribute it and/or
/// modify it under the terms of the GNU General Public License
/// as published by the Free Software Foundation; either version 3
/// of the License, or any later version.
///
/// You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
///          Created  17 Apr 2019
///

import 'package:mvc_template/src/view.dart';

import 'package:mvc_template/src/controller.dart';

class MyMenu extends Menu {
  MyMenu() : super() {
    _con = Contact();

//    if (_con.app.loggedIn) {
//      if (_con.app.isAnonymous) {
//        tailItems = [
//          PopupMenuItem(value: "SignIn", child: Text("Sign in...")),
//        ];
//      } else {
//        tailItems = [
//          PopupMenuItem(value: "Logout", child: Text("Logout")),
//        ];
//      }
//    } else {
//      tailItems = [
//        PopupMenuItem(value: "SignIn", child: Text("Sign in...")),
//      ];
//    }
  }
  Contact _con;

  @override
  List<PopupMenuItem<dynamic>> menuItems() => [
    PopupMenuItem(value: "Resync", child: Text("Resync")),
  ];

  @override
  Future<void> onSelected(dynamic menuItem) async {
    switch (menuItem) {
      case 'Resync':
        break;
      case 'Logout':
        break;
      case 'SignIn':
//        Navigator.push(
//            _con.context, MaterialPageRoute(builder: (context) => SignIn()));
        break;
      default:
    }
  }
}