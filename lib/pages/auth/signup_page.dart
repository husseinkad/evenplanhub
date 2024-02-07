import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../controllers/signup_controller.dart';
import '../../utiles/textstyles.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انشاء حساب جديد', style: CustomTextStyles.titleTextStyleBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/signUpPageLogo.svg',
                  width: 220,
                ),
              ),
              const Gap(40),
              _buildTextField(
                controller: displayNameController,
                labelText: 'الاسم',
                context: context,
              ),
              const Gap(16),
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
              _buildTextField(
                controller: confirmPasswordController,
                labelText: 'تاكيد كلمة السر',
                obscureText: true,
                context: context,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => ref.read(signUpNotifierProvider.notifier).signUp(displayNameController.text, passwordController.text, confirmPasswordController.text, emailController.text),
                  style: ElevatedButton.styleFrom(
                    textStyle: CustomTextStyles.defaultTextStyle,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('انشاء الحساب'),
                ),
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لديك حساب بل فعل؟',
                    style: CustomTextStyles.smallTextStyle,
                  ),
                  TextButton(
                      onPressed: () {
                        // Get.to(SignUpPage());
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style: CustomTextStyles.smallTextStyleBold,
                      )),
                ],
              ),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
    );
  }
}
