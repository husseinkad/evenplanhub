import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenplanhub/utiles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class ViewAllPage extends StatelessWidget {
  final String title;
  const ViewAllPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: CustomTextStyles.defaultTextStyleBold),
      ),
      body: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
             color: Colors.grey[200],
             borderRadius: BorderRadius.circular(8)
            ),
            
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    // Get.to();
                  },
                  child: Container(
                    width: 120,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://media.weddingz.in/images/6fb865d3052d1999173caf2fbc40f1f8/best-wedding-reception-halls-in-patna-you-will-absolutely-fall-in-love-with_1200x800.jpg',
                        placeholder: (context, url) => Container(
                              color: Colors.grey[100],
                            )),
                  ),
                ),
                const Gap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
