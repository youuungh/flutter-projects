import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/network_provider.dart';

import 'login_api.dart';

part 'login_api_service.g.dart';

@Riverpod(keepAlive: true)
LoginApiClient loginApiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  var localhost = "localhost";

  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }

  return LoginApiClient(dio, baseUrl: "http://$localhost:8080/api/v1");
}