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

class Controller extends ControllerMVC {
  factory Controller() => _this ??= Controller._();
  static Controller _this;

  /// In this Controller, we're actually using 'Composition' and superimposing
  /// another Controller to actually run in tandem with this one.
  /// This is so to emphasize the many functions and features in this class.
  /// The other Controller is part of the Contacts App can is merely for
  /// demonstration purposes. Merely delete every reference of 'con' and
  /// now use this class with your own code.
  Controller._() : super() {
    con = Contact();
  }
  Contact con;

  // Access to the app controller
  MyAppController get app => _app ??= MyAppController();
  MyAppController _app;

  /// Initialize any 'time-consuming' operations at the beginning.
  /// Initialize asynchronous items essential to the Mobile Applications.
  /// Typically called within a FutureBuilder() widget.
  ///
  @override
  Future<bool> initAsync() {
    return con.initAsync();
  }

  /// The framework will call this method exactly once.
  /// Only when the Controller's [State] object is first created.
  ///
  @override
  void initState() async {
    /// Link this 'Contact' controller to this Controller's state object.
    con.addState(this.stateMVC);
    con.initState();
  }

  /// The framework calls this method when the Controller's [State] object will never
  /// build again.Note: THERE IS NO GUARANTEE THIS METHOD WILL RUN in the Framework.
  ///
  @override
  void dispose() {
    con.dispose();
    super.dispose();
  }

  /// The framework calls this method whenever it removes this [State] object
  /// from the tree.
  ///
  @override
  void deactivate() {
    con.deactivate();
  }

  /// Override this method to respond when the [widget] changes (e.g., to start
  /// implicit animations).
  ///
  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    con.didUpdateWidget(oldWidget);
  }

  /// Called when the system puts the app in the background or
  /// returns the app to the foreground.
  /// Passing these possible values:
  /// AppLifecycleState.paused (may enter the suspending state at any time)
  /// AppLifecycleState.resumed
  /// AppLifecycleState.inactive (may be paused at any time)
  /// AppLifecycleState.suspending (Android only)
  ///
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    con.didChangeAppLifecycleState(state);
  }

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  ///
  @override
  void didChangeMetrics() {
    con.didChangeMetrics();
  }

  /// Called when the platform's text scale factor changes.
  ///
  @override
  void didChangeTextScaleFactor() {
    con.didChangeTextScaleFactor();
  }

  /// Called when the system tells the app that the user's locale has changed.
  ///
  @override
  void didChangeLocale(Locale locale) {
    con.didChangeLocale(locale);
  }

  /// Called when the system is running low on memory.
  ///
  @override
  void didHaveMemoryPressure() {
    con.didHaveMemoryPressure();
  }

  /// Called when the system changes the set of active accessibility features.
  ///
  @override
  void didChangeAccessibilityFeatures() {
    con.didChangeAccessibilityFeatures();
  }

  /// Called when a dependency of the Controller's [State] object changes.
  ///
  @override
  void didChangeDependencies() {
    con.didChangeDependencies();
  }

  /// During development, if a hot reload occurs, the reassemble method is called.
  /// This provides an opportunity to reinitialize any data that was prepared
  /// in the initState method.
  ///
  @override
  void reassemble() {
    con.reassemble();
  }

  /// Provide the setState() function to the Controller
  ///
  @override
  void setState(fn) {
    con.setState(fn);
  }

  /// This is the same as the setState() function.
  ///
  @override
  void refresh() {
    con.refresh();
  }

  /// This is the same at the setState() functions.
  /// Allow for a more accurate description
  ///
  @override
  void rebuild() {
    con.rebuild();
  }

  /// This is the same as the setState() functions.
  /// For those accustom to the 'Provider' approach.
  ///
  @override
  void notifyListeners() {
    con.notifyListeners();
  }
}
