import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_provider.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) => throw Exception("Provider was not initialized");
