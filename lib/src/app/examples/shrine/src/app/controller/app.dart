///
/// Copyright (C) 2019 Andrious Solutions
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
///          Created  09 Oct 2019
///
///

import 'package:mvc_template/src/app/examples/shrine/src/model.dart' show i10nWords;

import 'package:mvc_template/src/app/examples/shrine/src/controller.dart' show AppController;

import 'package:mvc_template/src/app/examples/shrine/src/view.dart' show I10n;

class ShrineApp extends AppController {
  @override
  initApp() {
    I10n.init(); //  I10n.init(map: i10nWords);  // Try the map object instead!
  }
}


