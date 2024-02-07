import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchController, List<String>>((ref) {
  return SearchController();
});

class SearchController extends StateNotifier<List<String>> {
  SearchController() : super([]);

  void performSearch(String query) {
    // Replace this with your actual search logic
    // For simplicity, we return a list of items containing the query string
    state = List.generate(10, (index) => 'Result ${index + 1}: $query');
  }
}
