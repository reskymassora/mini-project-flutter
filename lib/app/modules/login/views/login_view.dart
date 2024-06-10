import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Bg-Login Register.png'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      'assets/login_logo1.png',
                    ))),
                  ),
                  Text(
                    'Welcome To Azalea',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Username
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWrapper(
                          formField: TextFormField(
                            controller: controller.emailController,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  //Password
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWrapper(
                          formField: TextFormField(
                            controller: controller.passwordController,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 21,
                  ),

                  //Button Login
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD567CD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Get.toNamed('/register');
                        }, 
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
