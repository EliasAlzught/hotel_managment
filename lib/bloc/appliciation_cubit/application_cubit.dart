import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../controller/data_store.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  StreamSubscription? _sub;
  Key key= UniqueKey();
  static late PackageInfo info;
  StreamSubscription? _streamSubscription;

  static Future<void> init() async {
    info = await PackageInfo.fromPlatform();
  }

  ApplicationCubit() : super(ApplicationInitial());

  void notify() => emit(ApplicationInitial());

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
  void restart() async {
    key = UniqueKey();
    emit(ApplicationInitial());
  }
  Future<void> switchTheme() async {
    try {
      await DataStore.instance.switchTheme();
    } finally {
      emit(ApplicationInitial());
    }
  }
}
