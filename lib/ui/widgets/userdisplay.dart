import 'package:assestment/models/usermodel.dart';
import 'package:assestment/providers/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListView extends ConsumerWidget {
  final List<Usermodel> users;
  final String searchQuery;

  const UserListView(
      {super.key, required this.users, required this.searchQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Apply search filter
    final filteredUsers = users
        .where((user) =>
            user.name!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(userProvider); // Refresh data
      },
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(), // Ensure scrolling
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(filteredUsers[index].name![0])),
            title: Text(filteredUsers[index].name!),
            subtitle: Text(filteredUsers[index].email!),
          );
        },
      ),
    );
  }
}
