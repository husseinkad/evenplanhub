import 'package:evenplanhub/pages/searchpage.dart';
import 'package:evenplanhub/utiles/textstyles.dart';
import 'package:flutter/material.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'عن ماذا تبحث؟',
            style: CustomTextStyles.defaultTextStyleBold,
          ),
        ),
        GestureDetector(
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
                height: 50,
                width: 600,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(
                      12.0) //
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 20,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'ابحث الأن...',
                          style: CustomTextStyles.subtitleTextStyleSmall,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    ),
  );
  }
}

