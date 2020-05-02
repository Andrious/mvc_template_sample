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

class AppCon extends AppConMVC {
  factory AppCon() => _this ??= AppCon._();
  AppCon._();
  static AppCon _this;

  void onChangedApp(bool change) {
    shrine = change;
  }

  bool shrine = false;

  void onChangedMaterial(bool material) {
    App.vw.switchUI = false;
    switchUI = false;
    if (material) {
      App.vw.useMaterial = true;
      App.vw.useCupertino = false;
    } else {
      App.vw.useMaterial = false;
      App.vw.useCupertino = true;
    }
    useMaterial = material;
    useCupertino = false;
  }

  void onChangediOS(bool ios) {
    App.vw.switchUI = false;
    switchUI = false;
    if (ios) {
      App.vw.useMaterial = false;
      App.vw.useCupertino = true;
    } else {
      App.vw.useMaterial = true;
      App.vw.useCupertino = false;
    }
    useCupertino = ios;
    useMaterial = false;
  }

  bool useMaterial = false;
  bool useCupertino = false;
  bool switchUI = false;
}

class MyAppController extends AppController {
  factory MyAppController() => _this ??= MyAppController._();
  static MyAppController _this;

  /// You can pass the State object
  MyAppController._() : super(null);

  @override
  void initApp() {
    /// Initialize any immediate 'none time-consuming' operations at start up.
  }

  /// Initialize any 'time-consuming' operations at the beginning.
  /// Initialize items essential to the Mobile Applications.
  /// Implement any asynchronous operations needed done at start up.
  ///
  @override
  Future<bool> initAsync() async {
    return super.initAsync();
  }

  /// The framework will call this method exactly once.
  /// Only when the [State] object is first created.
  @override
  void initState() {
    /// Override this method to perform initialization that depends on the
    /// location at which this object was inserted into the tree.
    /// (i.e. Subscribe to another object it depends on during [initState],
    /// unsubscribe object and subscribe to a new object when it changes in
    /// [didUpdateWidget], and then unsubscribe from the object in [dispose].
    super.initState();
  }

  /// The framework calls this method whenever it removes this [State] object
  /// from the tree.
  @override
  void deactivate() {
    /// The framework calls this method whenever it removes this [State] object
    /// from the tree. It might reinsert it into another part of the tree.
    /// Subclasses should override this method to clean up any links between
    /// this object and other elements in the tree (e.g. if you have provided an
    /// ancestor with a pointer to a descendant's [RenderObject]).
    super.deactivate();
  }

  /// The framework calls this method when this [State] object will never
  /// build again.
  /// Note: THERE IS NO GUARANTEE THIS METHOD WILL RUN in the Framework.
  @override
  void dispose() {
    /// The framework calls this method when this [State] object will never
    /// build again. The [State] object's lifecycle is terminated.
    /// Subclasses should override this method to release any resources retained
    /// by this object (e.g., stop any active animations).
    ///ToDo Implement any class 'clean up' routines when shutting down.
    super.dispose();
  }

  /// Called when the system puts the app in the background or
  /// returns the app to the foreground.
  ///
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  /// Implement your own error routine.
  ///
  @override
  void onError(FlutterErrorDetails details) {
    super.onError(details);
  }
}
