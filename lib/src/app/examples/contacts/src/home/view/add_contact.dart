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


class AddContactPage extends StatefulWidget {
  AddContactPage({this.contact, this.title, Key key}) : super(key: key);
  final Object contact;
  final String title;

  @override
  State createState() => _AddContactState();
}

class _AddContactState extends StateMVC<AddContactPage> {

  _AddContactState(): super(Contact()){
    con = controller;
  }
  Contact con;

  @override
  void initState() {
    super.initState();
    con.add.init(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.useCupertino ? null : AppBar(
        title: Text(widget.title ?? "Add a contact"),
        actions: [
          FlatButton(
            child: Icon(Icons.save, color: Colors.white),
            onPressed: () {
              con.add.onPressed();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Form(
            key: con.add.formKey,
            child: ListView(
              children: [
                con.add.givenName.textFormField,
                con.add.middleName.textFormField,
                con.add.familyName.textFormField,
                con.add.prefix.textFormField,
                con.add.suffix.textFormField,
                con.add.company.textFormField,
                con.add.jobTitle.textFormField,
                con.add.street.textFormField,
                con.add.city.textFormField,
                con.add.region.textFormField,
                con.add.postcode.textFormField,
                con.add.country.textFormField,
              ],
            )),
      ),
    );
  }
}
