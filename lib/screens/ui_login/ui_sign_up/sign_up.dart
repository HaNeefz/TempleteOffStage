import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offstage_common_bnv/components/default_button.dart';
import 'package:offstage_common_bnv/components/default_textfield.dart';
import 'package:offstage_common_bnv/screens/ui_login/ui_sign_up/controller/signup_controller.dart';

import 'components/textfield_otp.dart';

class SignupPage extends GetView<SignUpController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  if (controller.verified.value) {
                    return uiOTP();
                  } else {
                    return uiPhoneNumber();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column uiOTP() {
    return Column(
      children: [
        Text("Verification",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Please your code number",
            style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 20),
        TextFieldOTP(
          onSuccess: (otp) => controller.checkCode(otp),
        ),
        Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container()),
      ],
    );
  }

  Column uiPhoneNumber() {
    return Column(
      children: [
        Text("Verification",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Please your phone number",
            style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 20),
        DefaultTextField(
          controller: controller.controllerPhoneNumber.value,
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
          Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
