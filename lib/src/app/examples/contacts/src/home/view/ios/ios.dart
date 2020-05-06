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

/// At a glance you can see what of the three MVC components are used here.
/// In this case, it's View & Controller
///
import 'package:mvc_template/src/view.dart';

import 'package:mvc_template/src/controller.dart';

class MyiOS extends StateMVC<MyHome> {
  MyiOS() : super(Controller()) {
    con = controller;
  }

  /// As it happens, this Controller uses yet another controller.
  /// It's part of the 'Contacts app' example 'superimposed' on this template.
  /// Thus, you're going to see references like such, 'con.con.'
  /// Normally, you would merely modify the Controller code directly.
  Controller con;

  void initState() {
    super.initState();
    // Init asynchronous operations.
    initAsync();
  }

  // The View!
  @override
  Widget build(BuildContext context) {
//    if (!con.app.loggedIn) return SignIn();
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: Colors.white,
          inactiveColor: CupertinoColors.darkBackgroundGray.withOpacity(0.8),
          backgroundColor: CupertinoTheme.of(context).primaryColor,
          border: Border(),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: const Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.create_solid),
              title: const Text('Create'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              title: const Text('Settings'),
            ),
          ]),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                key: con.con.list.scaffoldKey,
                navigationBar: CupertinoNavigationBar(),
                child: Material(
                  child: contactList(con.con),
                ),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(),
                  child: SafeArea(
                      top: true,
                      child: Column(
                        children: <Widget>[
                          Container(color: Colors.yellow, padding: EdgeInsets.all(4.0), child: CupertinoTextField()),
                          Material(
                            child: AddContactPage(),
                          )
                        ],
                      )));
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(),
                child: SafeArea(
                    top: true,
                    child: Column(
                      children: <Widget>[
                        Container(color: Colors.yellow, padding: EdgeInsets.all(16.0), child: CupertinoTextField()),
                        Material(child: const Text('Settings'))
                      ],
                    )),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }

  @override
  void onError(FlutterErrorDetails details) {
    //ToDo Implement your error routine.
    print(details.exception.toString());
  }
}
