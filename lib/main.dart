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
///          Created  21 Apr 2020
///

import 'package:mvc_template/src/view.dart' show App, MyView, runApp, ShrineApp;

import 'package:mvc_template/src/controller.dart' show AppCon;

void main() => runApp(MyApp());

class MyApp extends App {
  MyApp()

      /// Note, all the parameters available to you are being outlined here.
      /// I'm passing null just so you see that they exist.
      : super(
          con: AppCon(),
          key: null,
          loadingScreen: null,
          errorHandler: null,
          errorScreen: null,
          reportError: null,
        );

  /// With MVC, your app begins with a View.
  /// Your app's not instantiated until all the Error Handling is in place.
  @override
  createView() {
    var app = AppCon();
    if (app.shrine) {
      return ShrineApp();
    } else {
      return MyView(
        useMaterial: app.useMaterial,
        useCupertino: app.useCupertino,
        switchUI: app.switchUI,
      );
    }
  }
}
