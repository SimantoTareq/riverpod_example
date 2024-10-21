import 'package:riverpod/riverpod.dart';
import 'package:riverpod_example/api/services.dart';

final userDataProvider = FutureProvider<List>((ref) async {
  return ref.watch(userProvider).getUsers();
});