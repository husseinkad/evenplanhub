import 'package:evenplanhub/utiles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20),
            Center(
              child: ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.white,
                  child: Image.network(
                    'https://i.guim.co.uk/img/media/66767bbb27ae0e99d0dfb2975ff2a2b3db9e1c93/37_6_1612_967/master/1612.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=2a212447d637483b953a4e91b042f0ce',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'حيدر سعدون',
                style: CustomTextStyles.defaultTextStyle,
              ),
            ),
            const Text(
              '07717432922',
              style: CustomTextStyles.smallTextStyle,
            ),
           
        
            pageContainer(context, 'assets/icons/personIcon.svg', 'تعديل معلومات'),
            pageContainer(context, 'assets/icons/languageIcon.svg', 'الطلبات السابقة'),
      
          ],
        ),
      ),
    );
  }
}



pageContainer(BuildContext context, String icon, String title){
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person_2_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: CustomTextStyles.smallTextStyle,
            ),
          ),
          const Expanded(child: SizedBox()),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_forward_ios, size: 18,)
          ),
        ],
      ),
      SizedBox(
          child: const Divider(thickness: 0.3,))
    ],
  );
}
