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
/// In this case, it's Model, View & Controller
///
import 'package:mvc_template/src/home/model/model.dart';

import 'package:mvc_template/src/model.dart'
    show
        City,
        Company,
        Contact,
        Country,
        DisplayName,
        Email,
        FamilyName,
        GivenName,
        Id,
        JobTitle,
        MiddleName,
        Phone,
        Postcode,
        Prefix,
        Region,
        Street,
        Suffix,
        Widget;

import 'package:mvc_template/src/view.dart'
    show BuildContext, FieldWidgets, FormState, GlobalKey, ScaffoldState;

import 'package:mvc_template/src/controller.dart' as c show Contact;

class ContactAdd extends ContactEdit {
  ContactAdd(this.con) : super(con);
  final c.Contact con;

  @override
  void init([Object contact]) {
    super.init(contact);
    phone = Phone.single(phone.object);
    email = Email.single(email.object);
  }

  void onPressed([BuildContext context]) {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    _inForm = false;
    add();
    refresh();
  }
}

class ContactEdit extends ContactList {
  ContactEdit(this.con)
      : model = Model(),
        super(con);
  final Model model;
  final c.Contact con;

  bool _inForm = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey {
    if (!_inForm) {
      _inForm = true;
    }
    return _formKey;
  }

  Future add([Contact contact]) {
    contact ??= _contact;
    return model.addContact(contact.toMap);
  }

  Future<bool> delete([Contact contact]) async {
    contact ??= _contact;
    bool delete = await model.deleteContact(contact.toMap);
    return delete;
  }

  Future<int> undelete([Contact contact]) {
    contact ??= _contact;
    return model.undeleteContact(contact.toMap);
  }
}

class ContactList extends ContactFields {
  ContactList(this.con) : super();
  final c.Contact con;
  Contact _contact;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Contact> get items => _contacts;
  List<Contact> _contacts;

  Future<List<Contact>> refresh() async {
    _contacts = await con.getContacts();
    con.refresh();
    return _contacts;
  }

  void onPressed() => sort();

  void sort() async {
    _contacts = await con.sort();
    con.refresh();
  }

  void init([Object contact]) {
    if (contact == null) {
      _contact = Contact();
    } else {
      if (contact is! Contact) return;
      _contact = (contact as Contact);
    }
    _id = Id(_contact);
    _displayName = DisplayName(_contact);
    _givenName = GivenName(_contact);
    _middleName = MiddleName(_contact);
    _familyName = FamilyName(_contact);
    _prefix = Prefix(_contact);
    _suffix = Suffix(_contact);
    _company = Company(_contact);
    _jobTitle = JobTitle(_contact);
    _phone = Phone(_contact);
    _email = Email(_contact);
    _street = Street(_contact);
    _city = City(_contact);
    _region = Region(_contact);
    _postcode = Postcode(_contact);
    _country = Country(_contact);
  }

  Widget get leading => displayName.circleAvatar;

  Widget get title => displayName.text;
}

class ContactFields {
  FieldWidgets<Contact> _id,
      _displayName,
      _givenName,
      _middleName,
      _familyName,
      _prefix,
      _suffix,
      _company,
      _jobTitle,
      _phone,
      _email,
      _street,
      _city,
      _region,
      _postcode,
      _country;

  Id get id => _id;
  set id(Id id) => _id = id;

  DisplayName get displayName => _displayName;
  set displayName(DisplayName name) => _displayName = name;

  GivenName get givenName => _givenName;
  set givenName(GivenName name) => _givenName = name;

  MiddleName get middleName => _middleName;
  set middleName(MiddleName name) => _middleName = name;

  FamilyName get familyName => _familyName;
  set familyName(FamilyName name) => _familyName = name;

  Prefix get prefix => _prefix;
  set prefix(Prefix prefix) => _prefix = prefix;

  Suffix get suffix => _suffix;
  set suffix(Suffix suffix) => _suffix = suffix;

  Company get company => _company;
  set company(Company company) => _company = company;

  JobTitle get jobTitle => _jobTitle;
  set jobTitle(JobTitle job) => _jobTitle = job;

  Phone get phone => _phone;
  set phone(Phone phone) => _phone = phone;

  Email get email => _email;
  set email(Email email) => _email = email;

  Street get street => _street;
  set street(Street street) => _street = street;

  City get city => _city;
  set city(City city) => _city = city;

  Region get region => _region;
  set region(Region region) => _region = region;

  Postcode get postcode => _postcode;
  set postcode(Postcode postcode) => _postcode = postcode;

  Country get country => _country;
  set country(Country country) => _country = country;
}
