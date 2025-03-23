import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final storage = GetStorage();
  storage.write('IsFirstTime', true);
  print('Storage cleared! IsFirstTime set to true');
}

//flutter run -t lib/clear_storage.dart
