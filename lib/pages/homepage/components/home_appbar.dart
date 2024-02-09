import 'package:evenplanhub/pages/profilepage.dart';
import 'package:evenplanhub/utiles/textstyles.dart';
import 'package:flutter/material.dart';


AppBar appBar(BuildContext context) => AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
      },
      child: Container(
        height: 45,
        width: 45,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(12.0) //
          ),
        ),
      
      ),
    ),
  ),
  title: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'مبرحبا, محمد',
        style: CustomTextStyles.smallTextStyle,
      ),
      Text(
        'نحن هنا لنجعل حفلتك الافضل!',
        style: CustomTextStyles.subtitleTextStyle10,
      ),
    ],
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
         // Get.to();
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(
                Radius.circular(12.0) //
            ),
          ),
          child: const Icon(
            Icons.my_library_books_outlined,
            size: 20,
          ),
        ),
      ),
    ),
  ],
);
