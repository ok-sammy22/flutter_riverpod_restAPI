import 'package:assestment/models/usermodel.dart';
import 'package:assestment/services/apiservices.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider<List<Usermodel>>((ref) async {
  return NetworkService().fetchUsers();
});
