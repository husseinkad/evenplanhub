import 'package:evenplanhub/pages/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../controllers/login_controller.dart';
import '../../utiles/textstyles.dart';


class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  LoginPage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول', style: CustomTextStyles.titleTextStyleBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/loginPageLogo.svg', width: 250,),
              ),
              const Gap(40),
              _buildTextField(
                controller: emailController,
                labelText: 'البريد الالكتروني',
                context: context,
              ),
              const Gap(16),
              _buildTextField(
                controller: passwordController,
                labelText: 'كلمة السر',
                obscureText: true,
                context: context,
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: ()=> ref.read(loginNotifierProvider.notifier).login(passwordController.text, emailController.text),
                  style: ElevatedButton.styleFrom(
                    textStyle: CustomTextStyles.defaultTextStyle,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('تسجيل الدخول'),
                ),
              ),
              const Gap(40),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ليس لديك حساب بعد؟', style: CustomTextStyles.smallTextStyle,),
                  TextButton(onPressed: (){
                           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
                     }, child: const Text('انشاء حساب', style: CustomTextStyles.smallTextStyleBold,)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required BuildContext context,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: CustomTextStyles.defaultTextStyle,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: CustomTextStyles.defaultTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
    );
  }
}
