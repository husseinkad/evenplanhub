import 'package:evenplanhub/controllers/search_controller.dart';
import 'package:evenplanhub/utiles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه البحث', style: CustomTextStyles.defaultTextStyleBold,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(),
            Gap(20),
            SearchResultsList(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      style: CustomTextStyles.smallTextStyle,
       decoration: InputDecoration(
        hintText: 'قم بل بحث...', 
        labelStyle: CustomTextStyles.subtitleTextStyleSmall,
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.grey,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
       onChanged: (value) {
        ref.read(searchControllerProvider.notifier).performSearch(value);
      },
    );
  }
}



class SearchResultsList extends ConsumerWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(searchControllerProvider);
    return Expanded(
      child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                );
              },
      ),
    );
  }
}
