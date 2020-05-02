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
///          Created  27 Apr 2020
///
///

import 'package:mvc_template/src/view.dart';

import 'package:mvc_template/src/controller.dart';

import 'package:mvc_pattern/mvc_pattern.dart' as mvc;

import 'settings_group.dart';

import 'settings_item.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends mvc.StateMVC<SettingsScreen> {
  _SettingsState() : super(AppCon()) {
    _con = controller;
  }
  AppCon _con;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Styles.scaffoldBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Settings'),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    SettingsGroup(
                      items: [
                        SettingsItem(
                          label:'',
                          content: Text("Change settings and 'Hot Reload.'"),
                        ),
                        SettingsItem(
                          label: "Shrine",
                          content: CupertinoSwitch(
                            value: _con.shrine,
                            onChanged: (shrine){
                              _con.onChangedApp(shrine);
                              refresh();
                            },
                          ),
                        ),
                        SettingsItem(
                          label: "Material",
                          content: CupertinoSwitch(
                            value: _con.useMaterial,
                            onChanged:(material) {
                              _con.onChangedMaterial(material);
                              refresh();
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
