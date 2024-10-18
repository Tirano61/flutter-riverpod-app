


import 'package:flutter_riverpod/flutter_riverpod.dart';
//! autoDispose hace que haga el dispose del provider
final counterProvider = StateProvider<int>((ref) {
  return 5;
});