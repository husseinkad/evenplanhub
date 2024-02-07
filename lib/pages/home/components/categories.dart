import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenplanhub/pages/home/categories_details.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {

  final List<Map<String, String>> squares = [
    {'image': 'https://marqueehall.com/wp-content/uploads/2022/04/Perfect-Party-Hall.jpg', 'title': 'القاعات'},
    {'image': 'https://thumbnails.cbc.ca/maven_legacy/thumbnails/390/639/Image_2023-06-15_at_6.01_PM.jpeg', 'title': 'المصورين'},
    {'image': 'https://media.jobcase.com/images/2ed77174-585c-40b4-b60c-1fa07e8ca7fc/large', 'title': 'المنظمين'},
    {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkeGXVTfFpwOfdiL4GSFOp0kzBQ-GgIZcObAIO8csdTYht1fh4NDZl2YQQZ6He5T7Fasc&usqp=CAU', 'title': 'العرافين'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
            child: Text(
              'الاقسام',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 90 * squares.length.toDouble(),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 4.0, // spacing between rows
                crossAxisSpacing: 4.0,
              ),
              itemCount: squares.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryDetailsPage(title: squares[index]['title']!,)),
            );
                  },
                  child: Square(
                    image: squares[index]['image']!,
                    title: squares[index]['title']!,
                  ),
                );
              },
            ),
          ),
        ],
      );
  }
}

class Square extends StatelessWidget {
  final String image;
  final String title;

  Square({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => Container(color: Colors.grey[100]),
              width: 1000,
              height: 1000,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black54,
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}