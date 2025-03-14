import 'package:assestment/constants/appcolors.dart';
import 'package:assestment/constants/appsize.dart';
import 'package:assestment/constants/appstring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Search state management
final searchStateProvider = StateProvider<bool>((ref) => false);
final searchQueryProvider = StateProvider<String>((ref) => "");

// Persistent controller across rebuilds
final searchControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

class SearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = ref.watch(searchStateProvider);
    final searchController = ref.read(searchControllerProvider);

    return AppBar(
      backgroundColor: Appcolors.backgroundColor,
      title: isSearching
          ? Container(
              width: MediaQuery.of(context).size.width *
                  Appsize.seventyfivepercent,
              padding: EdgeInsets.symmetric(horizontal: Appsize.two),
              decoration: BoxDecoration(
                color: Appcolors.colorWhite,
                borderRadius: BorderRadius.circular(Appsize.ten),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state =
                      value; // Update search state
                },
                decoration: InputDecoration(
                  hintText: AppStrings.searchHint,
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search_sharp, color: Appcolors.iconColor),
                    onPressed: () {
                      // Manually update search query on search button click
                      ref.read(searchQueryProvider.notifier).state =
                          searchController.text;
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close, color: Appcolors.iconColor),
                    onPressed: () {
                      ref.read(searchStateProvider.notifier).state = false;
                      ref.read(searchQueryProvider.notifier).state = "";
                      searchController.clear();
                    },
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Appcolors.colorBlack),
              ),
            )
          : Text(AppStrings.greeting,
              style: TextStyle(color: Appcolors.textcolorblue)),
      actions: isSearching
          ? []
          : [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  ref.read(searchStateProvider.notifier).state = true;
                },
              ),
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
