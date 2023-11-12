import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:hive_flutter/hive_flutter.dart';

class DataStore {
  late Box<dynamic> box;

  static const THEME = "theme";
  static const DEFAULT_BOX = "hotel_box";

  static final DataStore _instance = DataStore._internal();

  static DataStore get instance => _instance;

  DataStore._internal();

  /// Getters
  bool get isDarkModeEnabled => box.get(
        THEME,
        defaultValue: window.platformBrightness == Brightness.dark,
      )!;




  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(DEFAULT_BOX);
    log("Datastore initialized", name: "$runtimeType");
  }

  Future<void> switchTheme() => box.put(THEME, !isDarkModeEnabled);




}
