import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/network_provider.dart';

import 'home_api.dart';

part 'home_api_service.g.dart';

@riverpod
HomeApi homeApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  var localhost = "localhost";

  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }

  return HomeApi(dio, baseUrl: 'http://$localhost:8080/api/v1');
}
