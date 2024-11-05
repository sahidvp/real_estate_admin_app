import 'package:flutter/material.dart';
import 'package:realestate_admin_app/utils/image_path/image_path.dart';
import 'package:realestate_admin_app/utils/media_query.dart';
import 'package:realestate_admin_app/view/logn_screen/widgets/form_field.dart';
import 'package:realestate_admin_app/view/logn_screen/widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);
    final sh = responsive.getHeightpercentage(2);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(ImgPath.homeLogo),
              ),
              formField("Email", _emailController, false),
              SizedBox(height: sh),
              formField("Password", _passwordController, true,),
              SizedBox(height: sh * 2),
              sumbitButton(
                  context, _emailController, _passwordController, responsive),
            ],
          ),
        ),
      ),
    );
  }
}
