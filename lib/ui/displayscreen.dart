import 'package:assestment/providers/apiprovider.dart';
import 'package:assestment/ui/widgets/searchappbar.dart';
import 'package:assestment/ui/widgets/userdisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Displayscreen extends ConsumerWidget {
  const Displayscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: SearchAppBar(),
      body: userAsyncValue.when(
        data: (users) => UserListView(users: users, searchQuery: searchQuery),
        error: (error, _) =>
            const Center(child: Text("Error loading, please refresh")),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
