import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/common/failure/failure.dart';

abstract base class BaseViewModel with ChangeNotifier {
  BaseViewModel() {
    onBindings();
  }

  String get tag;

  VMState state = VMState.none;

  String stateError = '';

  @mustCallSuper
  void onBindings() {
    FirebaseAnalytics.instance.logEvent(
      name: 'Create$tag',
    );
  }

  Future<void> flow(FutureOr Function() action) async {
    try {
      state = VMState.loading;
      notifyListeners();
      await action();
      state = VMState.loaded;
      notifyListeners();
    } catch (e) {
      state = VMState.error;
      notifyListeners();
      rethrow;
    }
  }

  @mustCallSuper
  @override
  void dispose() {
    FirebaseAnalytics.instance.logEvent(
      name: 'Dispose$tag',
    );
    super.dispose();
  }

  Future<T> eitherHandler<T>(Future<Either<Failure?, T>> Function() f) async {
    return f().fold(
      (l) {
        state = VMState.error;
        notifyListeners();
        stateError = l?.message ?? 'Unknown error';
        return Future.error(l ?? 'Unknown error');
      },
      (r) {
        return Future.value(r);
      },
    );
  }
}

enum VMState {
  loading,
  loaded,
  error,
  none;

  bool get isLoading => this == VMState.loading;
  bool get isLoaded => this == VMState.loaded;
  bool get isError => this == VMState.error;
  bool get isNone => this == VMState.none;
}
