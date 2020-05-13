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

import 'package:mvc_template/src/model.dart' as m;

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactDetailsPage extends StatelessWidget {
  ContactDetailsPage({this.contact, Key key})
      : con = Controller(),
        super(key: key) {
    con.edit.init(contact);
  }
  final Object contact;
  final Controller con;

  @override
  Widget build(BuildContext context) => Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: App.colorTheme, //Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: SetState(
          builder: (context, _) => Scaffold(
                appBar: App.useCupertino
                    ? null
                    : AppBar(title: con.title, actions: [
                        FlatButton(
                            child: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              showBox(
                                      text: 'Delete this contact?',
                                      context: context)
                                  .then((bool delete) {
                                if (delete)
                                  con.delete(contact).then((bool delete) {
                                    if (delete) con.list.refresh();
                                    Navigator.of(context).pop();
                                  });
                              });
                            }),
                      ]),
                body: CustomScrollView(slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      con.edit.givenName.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                      con.edit.middleName.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                      con.edit.familyName.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                      con.edit.prefix.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                      con.edit.suffix.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                      con.edit.company.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                      con.edit.jobTitle.onListTile(tap: () {
                        editContact(contact, context);
                      }),
                    ]),
                  )
                ]),
                bottomNavigationBar: SimpleBottomAppBar(
                  button01: HomeBarButton(onPressed: () {
                    Navigator.of(context).pop();
                  }),
                  button02: SearchBarButton(),
                  button03: EditBarButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AddContactPage(
                            contact: contact, title: 'Edit a contact')));
                  }),
                ),
              )));

  editContact(m.Contact contact, BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            AddContactPage(contact: contact, title: 'Edit a contact')));
  }
}
