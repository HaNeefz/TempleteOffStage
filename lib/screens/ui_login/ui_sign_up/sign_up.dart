import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/components/app_loading.dart';
import 'package:offstage_common_bnv/components/default_button.dart';
import 'package:offstage_common_bnv/components/default_textfield.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_up/controller/signup_controller.dart';

import 'components/textfield_otp.dart';

class SignupPage extends GetView<SignUpController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) controller.setName(Get.arguments);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: 100,
                  style: FlutterLogoStyle.stacked,
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (controller.verified.value &&
                      !controller.isAddImage.value) {
                    return uiOTP();
                  } else if (controller.verified.value &&
                      controller.isAddImage.value) {
                    return uiAddImage();
                  } else
                    return uiPhoneNumber();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(String title, String subtitle) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Column uiAddImage() {
    return Column(
      children: [
        header("Sign up verification", "Import your image"),
        SizedBox(height: 20),
        Obx(() {
          if (controller.isLoading.value) {
            return CircleAvatar(
              backgroundImage: MemoryImage(controller.image!),
              radius: 50,
            );
          } else {
            return Container();
          }
        }),
        SizedBox(height: 20),
        DefaultButton(
          text: 'Import image',
          backgroundColor: Colors.red,
          onPressed: !controller.isSendSignUp.value
              ? () => controller.onPickerImage()
              : null,
        ),
        SizedBox(height: 10),
        Obx(() {
          if (controller.isLoading.value && !controller.isSendSignUp.value) {
            return DefaultButton(
              text: 'Submit',
              onPressed: () => controller.onSubmit(),
            );
          } else if (controller.isLoading.value &&
              controller.isSendSignUp.value)
            return AppLoading();
          else
            return SizedBox();
        }),
      ],
    );
  }

  Column uiOTP() {
    return Column(
      children: [
        header("Sign up verification", "Please your code number"),
        SizedBox(height: 20),
        TextFieldOTP(
          onSuccess: (otp) => controller.checkCode(otp),
        ),
      ],
    );
  }

  Column uiPhoneNumber() {
    return Column(
      children: [
        header("Sign up verification", "Please your phone number"),
        SizedBox(height: 20),
        DefaultTextField(
          controller: controller.controllerName.value,
          label: 'Name',
        ),
        SizedBox(height: 10),
        DefaultTextField(
          controller: controller.controllerLastName.value,
          label: 'Last name',
        ),
        SizedBox(height: 10),
        DefaultTextField(
          controller: controller.controllerPassword.value,
          label: 'Password',
          secure: true,
        ),
        SizedBox(height: 10),
        DefaultTextField(
          controller: controller.controllerPhoneNumber.value,
          keyboard: TextInputType.number,
          prefixText: '+66',
          label: 'Phone number',
        ),
        SizedBox(height: 20),
        if (!controller.isPressedVerify.value)
          DefaultButton(
            text: 'Send OTP',
            onPressed: () => controller.setVerify(),
          )
        else
          AppLoading()
      ],
    );
  }
}
