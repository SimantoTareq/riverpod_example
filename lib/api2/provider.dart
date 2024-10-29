import 'package:riverpod/riverpod.dart';
import 'package:riverpod_example/api2/service.dart';

final usersDataProvider = FutureProvider<List>((ref) async {
  return ref.watch(usersProvider).getUsers();
});