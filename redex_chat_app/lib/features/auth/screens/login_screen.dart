import 'package:flutter/material.dart';
import 'package:redex_chat_app/colors.dart';
import 'package:redex_chat_app/common/utils/utils.dart';
import 'package:redex_chat_app/common/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redex_chat_app/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  void pickCountry(BuildContext context) {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();

    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    }else{
      showSnackBar(context: context, content: 'Fill out all the field.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'This app needs to verify your phone number',
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => pickCountry(context),
              child: const Text('Pick Country'),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                if (country != null) Text('+${country!.phoneCode}'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * .7,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: 'Phone number'),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .6),
            SizedBox(
              width: 90,
              child: CustomButton(
                onPressed: sendPhoneNumber,
                text: 'NEXT',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
