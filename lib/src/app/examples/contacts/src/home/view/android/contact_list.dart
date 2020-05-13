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

class ContactListState extends StateMVC<MyHome> {
  /// As part of the MVC design pattern,
  /// introduce the 'Controller' to this 'View.'
  ContactListState() : super(Contact()) {
    /// Right-click on 'controller' and see where its defined!
    this.con = controller;
  }

  Contact con;

  void initState() {
    super.initState();
    // Init asynchronous operations.
    initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: App.colorTheme,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: con.list.scaffoldKey,
        appBar: AppBar(title: Text('Contacts Example'), actions: <Widget>[
          FlatButton(
            child: Icon(Icons.sort_by_alpha, color: Colors.white),
            onPressed: con.list.sort,
          ),
          AppMenu.show(this),
        ]),
        drawer: platformDrawer(this),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              var route = MaterialPageRoute(
                builder: (BuildContext context) => AddContactPage(),
                fullscreenDialog: true,
              );
              await Navigator.of(context).push(route);
              await con.list.refresh();
            }),
        body: contactList(con),
      ),
    );
  }
}

Widget contactList(Contact con) {
  // App theme may change.
  ThemeData _theme = App.theme;
  return SafeArea(
    child: con.list.items == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: con.list.items?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Object c = con.child(index);
              return con.list.displayName.onDismissible(
                child: Container(
                  decoration: BoxDecoration(
                      color: _theme.canvasColor,
                      border: Border(
                          bottom: BorderSide(color: _theme.dividerColor))),
                  child: ListTile(
                    onTap: () {
                      var w = ContactDetailsPage(contact: c);
                      PageRoute route;
                      if (App.useMaterial) {
                        route = MaterialPageRoute(
                            builder: (BuildContext context) => w);
                      } else {
                        route = CupertinoPageRoute(
                            builder: (BuildContext context) => w);
                      }
                      Navigator.of(context)
                          .push(route)
                          .then((_) => con.list.refresh());
                    },
                    leading: con.list.displayName.circleAvatar,
                    title: con.list.displayName.text,
                  ),
                ),
                dismissed: (DismissDirection direction) {
                  con.delete(c).then((_) => con.list.refresh());
                  final String action =
                      (direction == DismissDirection.endToStart)
                          ? 'deleted'
                          : 'archived';
                  con.list.scaffoldKey.currentState?.showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 8000),
                      content: Text('You $action an item.'),
                      action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            con.edit
                                .undelete(c)
                                .then((_) => con.list.refresh());
                          })));
                },
              );
            },
          ),
  );
}

void addContact() async {}
