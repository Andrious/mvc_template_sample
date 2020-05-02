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
/// In this case, it's Model & Controller
///
import 'package:mvc_template/src/model.dart' as m;

import 'package:mvc_template/src/controller.dart';


class Contact extends ControllerMVC {
  factory Contact() => _this ??= Contact._();
  static Contact _this;

  bool _sortedAlpha;
  static const String _SORT_KEY = 'sort_by_alpha';

  Contact._()
      : _model = m.Model(),
        super();
  final m.Model _model;

  @override
  Future<bool> initAsync() async {
    await _model.initAsync();
    _sortedAlpha = await Prefs.getBoolF(_SORT_KEY, false);
    List it = await list.refresh();
    return it.length > 0;
  }

  @override
  void initState(){
    _addContacts = ContactAdd(this);
    _editContacts = _addContacts;
    _listContacts = _editContacts;
  }

  ContactAdd get add => _addContacts;
  ContactAdd _addContacts;

  ContactEdit get edit => _editContacts;
  ContactEdit _editContacts;

  ContactList get list => _listContacts;
  ContactList _listContacts;

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void setBuild() => _this?.refresh();

  Future<List<m.Contact>> getContacts() async {
    List<m.Contact> contacts = await _model.getContacts();
    if (_sortedAlpha) contacts.sort();
    return contacts;
  }

  Future<List<m.Contact>> sort() async {
    _sortedAlpha = !_sortedAlpha;
    Prefs.setBool(_SORT_KEY, _sortedAlpha);
    List<m.Contact> contacts = await getContacts();
    return contacts;
  }

  m.Contact child(int index) {
    m.Contact contact = list.items?.elementAt(index);
    list.init(contact);
    return contact;
  }

  Future<bool> delete(Object contact) async {
    if (contact is! m.Contact) return Future.value(false);
    bool delete = await edit.delete(contact as m.Contact);
    return delete;
  }
}
