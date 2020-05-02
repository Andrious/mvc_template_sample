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
///          Created  25 Apr 2020
///
///

import 'package:mvc_template/src/app/examples/contacts/src/view.dart';


class ContactsExampleApp extends AppView {
  ContactsExampleApp()
      : super(
    title: 'Contacts Plugin Example',
    routes: {'/add': (BuildContext context) => AddContactPage()},
    home: MyHome(),
    navigatorObservers: [NavListener()],
    theme: ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.orangeAccent[400],
    ),
  );
}

class NavListener extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (navigator == null)
      print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print("route ${newRoute?.toString()} previous ${oldRoute?.toString()}");
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didStopUserGesture() {
    print("The gesture stopped.");
  }
}


