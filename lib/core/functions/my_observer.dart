import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

//this is class observer for tracking the states of cubit

class MyObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    log("$bloc closed");
  }

  @override
  void onCreate(BlocBase bloc) {
    log("$bloc created");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
