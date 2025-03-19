import 'package:carwash/Constants/AppButtons.dart';
import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppInputFields.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Views/LandingView.dart';
import 'package:carwash/Views/RegisterView.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 60,
              backgroundColor: indClr,
              child: Icon(Icons.car_crash,color: bgColor,size: 40,),
            ),
            const SizedBox(height: 40),
            EmailFiled(labelText: "Email", hintText: "Enter email address..."),
            const SizedBox(height: 20),
            PasswordField(labelText: "Password", hintText: "Enter password..."),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?", style: TxtStyles.clickStyle)),
            const SizedBox(height: 15),
            MyButton(
                title: "LogIn",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LandingView()),
                      (route) => false);
                }),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: Divider(color: greyClr)),
                const SizedBox(width: 5),
                Text("or", style: TxtStyles.inputStyle),
                const SizedBox(width: 5),
                Expanded(child: Divider(color: greyClr)),
              ],
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: "Don't have an account?",
                style: TxtStyles.inputStyle,
                children: [
                  WidgetSpan(
                    child: InkWell(
                      child: Text(" Register", style: TxtStyles.clickStyle),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterView()),
                            (route) => false);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
