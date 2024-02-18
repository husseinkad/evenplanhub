import 'package:evenplanhub/main.dart';
import 'package:evenplanhub/pages/cartpage.dart';
import 'package:evenplanhub/pages/homepage/homepage.dart';
import 'package:evenplanhub/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class Home extends ConsumerWidget {
   Home({Key? key}) : super(key: key);
final selectedTabIndexProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     var selectedTabIndex = ref.watch(selectedTabIndexProvider);

    final List<Widget> pages = [
      const HomePage(),
      const CartPage(),
      const ProfilePage(),
      // Add other pages as needed
    ];

    return Scaffold(
      body: pages[selectedTabIndex], 
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 20,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTabIndex,
        onTap: (value) {
         ref.read(selectedTabIndexProvider.notifier).update((state) => value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
