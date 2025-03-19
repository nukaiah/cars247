import 'package:carwash/Constants/AppButtons.dart';
import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppInputFields.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Views/LoginView.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
            Row(
              children: [
                Flexible(
                  child: NameField(
                      labelText: "First Name", hintText: "Enter first name..."),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: NameField(
                      labelText: "Last Name", hintText: "Enter last name..."),
                ),
              ],
            ),
            const SizedBox(height: 20),
            EmailFiled(labelText: "Email", hintText: "Enter email address..."),
            const SizedBox(height: 20),
            MobileFiled(
                labelText: "Mobile", hintText: "Enter mobile 99xxxxxx12..."),
            const SizedBox(height: 20),
            PasswordField(labelText: "Password", hintText: "Enter password..."),
            const SizedBox(height: 20),
            MyButton(title: "Register"),
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
                text: "Already have an account?",
                style: TxtStyles.inputStyle,
                children: [
                  WidgetSpan(
                    child: InkWell(
                      child: Text(" Login", style: TxtStyles.clickStyle),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginView()),
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
