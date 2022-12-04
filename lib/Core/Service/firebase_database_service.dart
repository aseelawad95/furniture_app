import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

import '../Models/user_model.dart';

class FirebaseDatabaseService {
  late DatabaseReference _ref;

  FirebaseDatabaseService() {
    _ref = FirebaseDatabase.instance.ref('MyRoot');
  }

  Future<void> init() async {
    final database = FirebaseDatabase.instance;

    database.setLoggingEnabled(false);

    if (!kIsWeb) {
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(10000000);
    }

    if (!kIsWeb) {
      await _ref.keepSynced(true);
    }

    try {
      final counterSnapshot = await _ref.get();
      log(
        'Connected to directly configured database and read '
            '${counterSnapshot.value}',
      );
    } catch (err) {
      log('err : $err');
    }
  }

  Future<String> read() async {
    var result = await _ref.once();
    log('result : $result');
    log('result.runtimeType : ${result.runtimeType}');
    log('result.snapshot.value : ${result.snapshot.value}');
    log('result.snapshot.value.runtimeType : ${result.snapshot.value.runtimeType}');
    return json.encode(result.snapshot.value);
  }

  Future<UserModel> readUserData(String uid) async {
    var result = await _ref.child('user').once();
    log('result : ${result.snapshot.value}');
    var model = UserModel.fromJson(Map.from(result.snapshot.value as Map));
    log('model : ${model.toJson()}');
    return model;
  }

  Future<void> write(int value) async {
    await _ref.child('key1').set(value);
  }

  Future<void> writeUserData(UserModel model) async {
    _ref = FirebaseDatabase.instance.ref('MyRoot');
    log('model : ${model.toJson()}');
    await _ref.child('user').set(model.toJson());
  }
}