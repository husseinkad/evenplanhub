import 'package:evenplanhub/pages/homepage/components/categories.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'components/home_appbar.dart';
import 'components/lectures.dart';
import 'components/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBarWidget(),
            const Lectures(title: 'القاعات الاكثر تقييما',),
            MyGridView(),
            const Gap(5),
            // search bar takes to the search page, for future use

            // lectures widgets, I used the same data for each, easily edited for future use
            const Gap(5),
            const Lectures(title: 'المصورين الاكثر طلبا',),
            const Lectures(title: 'اشهر المنضمين',),
            const Lectures(title: 'اشهر العريفين',),
            
          ],
        ),
      ),
    );
  }
}
