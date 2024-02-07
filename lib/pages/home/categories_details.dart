import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenplanhub/utiles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String title;
  const CategoryDetailsPage({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: CustomTextStyles.defaultTextStyleBold),
      ),
      body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
              ),
        itemCount: 8,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(  
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    // Get.to();
                  },
                  child: Container(
                   clipBehavior: Clip.hardEdge, 
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8.0)
                        ),
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://media.weddingz.in/images/6fb865d3052d1999173caf2fbc40f1f8/best-wedding-reception-halls-in-patna-you-will-absolutely-fall-in-love-with_1200x800.jpg',
                        placeholder: (context, url) => Container(
                              color: Colors.grey[100],
                            )),
                  ),
                ),
                const Gap(6),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.place_outlined, size: 12),
                    Gap(4),
                    Text(
                      'قاعه شهيد محراب',
                      style: CustomTextStyles.smallTextStyle,
                    ),
                  ],
                ),
                const Gap(4),
                RatingBarIndicator(
                  rating: 4.50,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 16.0,
                  direction: Axis.horizontal,
                ),
                const Gap(6),
              ],
            ),
          );
        },
      ),
    );
  }
}
