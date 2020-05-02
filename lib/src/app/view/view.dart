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

import 'package:mvc_template/src/view.dart';

import 'package:mvc_template/src/controller.dart';

class MyView extends AppView {
  MyView({
    bool useMaterial,
    bool useCupertino,
    bool switchUI,
  }) : super(
          key: null,
          home: MyHome(),
          con: MyAppController(),
          controllers: null,
          object: null,
          navigatorKey: null,
          routes: null,
          initialRoute: null,
          onGenerateRoute: null,
          onUnknownRoute: null,
          navigatorObservers: null,
          builder: null,
          title: 'MVC App Template',
          onGenerateTitle: null,
          theme: null,
          darkTheme: null,
          themeMode: null,
          color: null,
          locale: null,
          localizationsDelegates: null,
          localeResolutionCallback: null,
          supportedLocales: null,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          switchUI: switchUI,
          debugShowMaterialGrid: null,
          showPerformanceOverlay: null,
          checkerboardRasterCacheImages: null,
          checkerboardOffscreenLayers: null,
          showSemanticsDebugger: null,
          debugShowCheckedModeBanner: false,
          debugShowWidgetInspector: null,
          debugPaintSizeEnabled: null,
          debugPaintBaselinesEnabled: null,
          debugPaintPointersEnabled: null,
          debugPaintLayerBordersEnabled: null,
          debugRepaintRainbowEnabled: null,
          errorHandler: null,
          errorScreen: null,
          reportError: null,
        );

  /// Clean things up when your app terminates.
  ///
  @override
  void dispose() {
    super.dispose();
  }

  /// During development, if a hot reload occurs, the reassemble method is called.
  ///
  @override
  void reassemble() {
    super.reassemble();
  }

  /// Default visual properties, like colors fonts and shapes, for this app's
  /// material widgets.
  ///
  /// A second [darkTheme] [ThemeData] value, which is used to provide a dark
  /// version of the user interface can also be specified. [themeMode] will
  /// control which theme will be used if a [darkTheme] is provided.
  ///
  /// The default value of this property is the value of [ThemeData.light()].
  ///
  @override
  ThemeData onTheme() => ThemeData(
        primarySwatch: App.colorTheme,
      );

  /// Override if you like to customize error handling.
  ///
  @override
  void onError(FlutterErrorDetails details) {
    super.onError(details);
  }

  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [WidgetBuilder] is used to construct a [PageRoute] specified by
  /// [pageRouteBuilder] to perform an appropriate transition, including [Hero]
  /// animations, to the new route.
  ///
  /// {@template flutter.widgets.widgetsApp.routes}
  /// If the app only has one page, then you can specify it using [home] instead.
  ///
  /// If [home] is specified, then it implies an entry in this table for the
  /// [Navigator.defaultRouteName] route (`/`), and it is an error to
  /// redundantly provide such a route in the [routes] table.
  ///
  /// If a route is requested that is not specified in this table (or by
  /// [home]), then the [onGenerateRoute] callback is called to build the page
  /// instead.
  ///
  /// The [Navigator] is only built if routes are provided (either via [home],
  /// [routes], [onGenerateRoute], or [onUnknownRoute]); if they are not,
  /// [builder] must not be null.
  /// {@endtemplate}
  ///
  /// If the routes map is not empty, the [pageRouteBuilder] property must be set
  /// so that the default route handler will know what kind of [PageRoute]s to
  /// build.
  @override
  Map<String, WidgetBuilder> onRoutes() => null;

  /// The name of the first route to show, if a [Navigator] is built.
  ///
  /// Defaults to [Window.defaultRouteName], which may be overridden by the code
  /// that launched the application.
  ///
  /// If the route contains slashes, then it is treated as a "deep link", and
  /// before this route is pushed, the routes leading to this one are pushed
  /// also. For example, if the route was `/a/b/c`, then the app would start
  /// with the three routes `/a`, `/a/b`, and `/a/b/c` loaded, in that order.
  ///
  /// Intermediate routes aren't required to exist. In the example above, `/a`
  /// and `/a/b` could be skipped if they have no matching route. But `/a/b/c` is
  /// required to have a route, else [initialRoute] is ignored and
  /// [Navigator.defaultRouteName] is used instead (`/`). This can happen if the
  /// app is started with an intent that specifies a non-existent route.
  ///
  /// The [Navigator] is only built if routes are provided (either via [home],
  /// [routes], [onGenerateRoute], or [onUnknownRoute]); if they are not,
  /// [initialRoute] must be null and [builder] must not be null.
  ///
  /// See also:
  ///
  ///  * [Navigator.initialRoute], which is used to implement this property.
  ///  * [Navigator.push], for pushing additional routes.
  ///  * [Navigator.pop], for removing a route from the stack.
  ///
  @override
  String onInitialRoute() => null;

  /// The route generator callback used when the app is navigated to a
  /// named route.
  ///
  /// If this returns null when building the routes to handle the specified
  /// [initialRoute], then all the routes are discarded and
  /// [Navigator.defaultRouteName] is used instead (`/`). See [initialRoute].
  ///
  /// During normal app operation, the [onGenerateRoute] callback will only be
  /// applied to route names pushed by the application, and so should never
  /// return null.
  ///
  /// This is used if [routes] does not contain the requested route.
  ///
  /// The [Navigator] is only built if routes are provided (either via [home],
  /// [routes], [onGenerateRoute], or [onUnknownRoute]); if they are not,
  /// [builder] must not be null.
  /// {@endtemplate}
  ///
  /// If this property is not set, either the [routes] or [home] properties must
  /// be set, and the [pageRouteBuilder] must also be set so that the
  /// default handler will know what routes and [PageRoute]s to build.
  ///
  @override
  RouteFactory onOnGenerateRoute() => null;

  /// Called when [onGenerateRoute] fails to generate a route, except for the
  /// [initialRoute].
  ///
  /// This callback is typically used for error handling. For example, this
  /// callback might always generate a "not found" page that describes the route
  /// that wasn't found.
  ///
  /// Unknown routes can arise either from errors in the app or from external
  /// requests to push routes, such as from Android intents.
  ///
  /// The [Navigator] is only built if routes are provided (either via [home],
  /// [routes], [onGenerateRoute], or [onUnknownRoute]); if they are not,
  /// [builder] must not be null.
  ///
  @override
  RouteFactory onOnUnknownRoute() => null;

  /// The list of observers for the [Navigator] created for this app.
  ///
  /// This list must be replaced by a list of newly-created observers if the
  /// [navigatorKey] is changed.
  ///
  /// The [Navigator] is only built if routes are provided (either via [home],
  /// [routes], [onGenerateRoute], or [onUnknownRoute]); if they are not,
  /// [navigatorObservers] must be the empty list and [builder] must not be null.
  ///
  @override
  List<NavigatorObserver> onNavigatorObservers() => null;

  /// Material specific features such as [showDialog] and [showMenu], and widgets
  /// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
  /// function.
  ///
  @override
  TransitionBuilder onBuilder() => null;

  /// A one-line description used by the device to identify the app for the user.
  ///
  /// On Android the titles appear above the task manager's app snapshots which are
  /// displayed when the user presses the "recent apps" button. On iOS this
  /// value cannot be used. `CFBundleDisplayName` from the app's `Info.plist` is
  /// referred to instead whenever present, `CFBundleName` otherwise.
  ///
  /// To provide a localized title instead, use [onGenerateTitle].
  ///
  @override
  String onTitle() => null;

  /// If non-null this callback function is called to produce the app's
  /// title string, otherwise [title] is used.
  ///
  /// The [onGenerateTitle] `context` parameter includes the [WidgetsApp]'s
  /// [Localizations] widget so that this callback can be used to produce a
  /// localized title.
  ///
  /// This callback function must not return null.
  ///
  /// The [onGenerateTitle] callback is called each time the [WidgetsApp]
  /// rebuilds.
  ///
  @override
  GenerateAppTitle onOnGenerateTitle(BuildContext context) => null;

  /// The primary color to use for the application in the operating system
  /// interface.
  ///
  /// For example, on Android this is the color used for the application in the
  /// application switcher.
  ///
  @override
  Color onColor() => null;

  /// The top-level [CupertinoTheme] styling.
  ///
  /// A null [theme] or unspecified [theme] attributes will default to iOS
  /// system values.
  ///
  @override
  CupertinoThemeData oniOSTheme() => null;

  /// The [ThemeData] to use when a 'dark mode' is requested by the system.
  ///
  /// Some host platforms allow the users to select a system-wide 'dark mode',
  /// or the application may want to offer the user the ability to choose a
  /// dark theme just for this application. This is theme that will be used for
  /// such cases. [themeMode] will control which theme will be used.
  ///
  /// This theme should have a [ThemeData.brightness] set to [Brightness.dark].
  ///
  /// Uses [theme] instead when null. Defaults to the value of
  /// [ThemeData.light()] when both [darkTheme] and [theme] are null.
  ///
  @override
  ThemeData onDarkTheme() => null;

  /// Determines which theme will be used by the application if both [theme]
  /// and [darkTheme] are provided.
  ///
  /// If set to [ThemeMode.system], the choice of which theme to use will
  /// be based on the user's system preferences. If the [MediaQuery.platformBrightnessOf]
  /// is [Brightness.light], [theme] will be used. If it is [Brightness.dark],
  /// [darkTheme] will be used (unless it is [null], in which case [theme]
  /// will be used.
  ///
  /// If set to [ThemeMode.light] the [theme] will always be used,
  /// regardless of the user's system preference.
  ///
  /// If set to [ThemeMode.dark] the [darkTheme] will be used
  /// regardless of the user's system preference. If [darkTheme] is [null]
  /// then it will fallback to using [theme].
  ///
  /// The default value is [ThemeMode.system].
  ///
  @override
  ThemeMode onThemeMode() => null;

  /// The initial locale for this app's [Localizations] widget is based
  /// on this value.
  ///
  /// If the 'locale' is null then the system's locale value is used.
  ///
  /// The value of [Localizations.locale] will equal this locale if
  /// it matches one of the [supportedLocales]. Otherwise it will be
  /// the first element of [supportedLocales].
  ///
  @override
  Locale onLocale() => null;

  /// Internationalized apps that require translations for one of the locales
  /// listed in [GlobalMaterialLocalizations] should specify this parameter
  /// and list the [supportedLocales] that the application can handle.
  ///
  @override
  Iterable<LocalizationsDelegate<dynamic>> onLocalizationsDelegates() => null;

  /// This callback is responsible for choosing the app's locale
  /// when the app is started, and when the user changes the
  /// device's locale.
  ///
  /// When a [localeListResolutionCallback] is provided, Flutter will first
  /// attempt to resolve the locale with the provided
  /// [localeListResolutionCallback]. If the callback or result is null, it will
  /// fallback to trying the [localeResolutionCallback]. If both
  /// [localeResolutionCallback] and [localeListResolutionCallback] are left
  /// null or fail to resolve (return null), the a basic fallback algorithm will
  /// be used.
  ///
  @override
  LocaleListResolutionCallback onLocaleListResolutionCallback() => null;

  /// This callback considers only the default locale, which is the first locale
  /// in the preferred locales list. It is preferred to set [localeListResolutionCallback]
  /// over [localeResolutionCallback] as it provides the full preferred locales list.
  ///
  /// This algorithm should be able to handle a null locale, which indicates
  /// Flutter has not yet received locale information from the platform.
  ///
  @override
  LocaleResolutionCallback onLocaleResolutionCallback() => null;

  /// The list of locales that this app has been localized for.
  ///
  /// By default only the American English locale is supported. Apps should
  /// configure this list to match the locales they support.
  ///
  /// This list must not null. Its default value is just
  /// `[const Locale('en', 'US')]`.
  ///
  /// The order of the list matters.
  ///
  @override
  Iterable<Locale> onSupportedLocales() => null;

  /// Turns on a [GridPaper] overlay that paints a baseline grid
  /// Material apps.
  ///
  /// Only available in checked mode.
  ///
  @override
  bool onDebugShowMaterialGrid() => null;

  /// Turns on a performance overlay.
  ///
  @override
  bool onShowPerformanceOverlay() => null;

  /// Turns on checkerboarding of raster cache images.
  ///
  @override
  bool onCheckerboardRasterCacheImages() => null;

  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  @override
  bool onCheckerboardOffscreenLayers() => null;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  @override
  bool onShowSemanticsDebugger() => null;

  /// Turns on a little "DEBUG" banner in checked mode to indicate
  /// that the app is in checked mode. This is on by default (in
  /// checked mode), to turn it off, set the constructor argument to
  /// false. In release mode this has no effect.
  ///
  @override
  bool onDebugShowCheckedModeBanner() => null;
}
