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
/// In this case, it's View
///
import 'package:mvc_template/src/view.dart';

/// We're just circumventing the template here and introduce
/// a working example. This will then better demonstrate
/// how to use the class StateMVC.
State MyAndroid() => ContactListState();

/// When you're ready. you can remove the above
/// line and uncomment the class below so to
/// implement your own StateMVC class and
/// display the Android platform's interface.

//class MyAndroid extends StateMVC<MyHome> {
//  MyAndroid() : super(){
//
//  }
//
//  @override
//  Future<bool> initAsync(){
//
//  }
//
//  @override
//  void initState() {
//
//  }
//
//  /// The View component of this MVC design pattern!
//  Widget build(BuildContext context){
//
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  @override
//  void deactivate() {
//    _state.deactivate();
//  }
//
//  @override
//  void didUpdateWidget(StatefulWidget oldWidget) {
//
//  }
//
//  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//
//  }
//
//  @override
//  void didChangeMetrics() {
//
//  }
//
//  @override
//  void didChangeTextScaleFactor() {
//  }
//
//  @override
//  void didChangeLocale(Locale locale) {
//
//  }
//
//  @override
//  void didHaveMemoryPressure() {
//
//  }
//
//  @override
//  void didChangeAccessibilityFeatures() {
//
//  }
//
//  @override
//  void didChangeDependencies() {
//
//  }
//
//  @override
//  void reassemble() {
//
//  }
//
//  @override
//  void setState(VoidCallback fn) {
//
//  }
//
//  @override
//  void refresh() {
//
//  }
//
//  @override
//  void onError(FlutterErrorDetails details) {
//    super.onError(details);
//  }
//}

