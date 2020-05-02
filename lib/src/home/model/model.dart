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

import 'package:mvc_template/src/model.dart';

/// Implementing composition merely to demonstrate a working app.
/// Conceivably you can switch out 'Contacts' with something else.
/// Or you simply reference and use this class directly.
class Model {
  factory Model() => _this ??= Model._();
  static Model _this;

  Model._() {
    _db = Contacts();
  }
  Contacts _db;

  Future<bool> initAsync() async {
    bool init = await _db.init();
    return init;
  }

  void dispose() {
    /// Note the name is different
    _db.disposed();
  }

  Future<List<Contact>> getContacts() async {
    var contacts = await _db.getContacts();
    return contacts;
  }

  Future<List<Contact>> listContacts(List<Map<String, dynamic>> query) async {
    var list = await _db.listContacts(query);
    return list;
  }

  Future<bool> addContact(Map<String, dynamic> contact) async {
    var add = await _db.addContact(contact);
    return add;
  }

  Future<bool> deleteContact(Map<String, dynamic> contact) async {
    var delete = await _db.deleteContact(contact);
    return delete;
  }

  Future<int> undeleteContact(Map contact) async {
    var undo = await _db.undeleteContact(contact);
    return  undo;
  }
}