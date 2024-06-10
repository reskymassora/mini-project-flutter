import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Bg-Login Register.png',
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Register Your Account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 18,
                  ),

                  //Email
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ('Email here...'),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Name
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWrapper(
                          formField: TextFormField(
                            controller: controller.nameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ('Name here...'),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Address
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWrapper(
                          formField: TextFormField(
                            controller: controller.addressController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ('Address here...'),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Phone Number
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone NUmber',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWrapper(
                          formField: TextFormField(
                            controller: controller.phoneNumberController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ('Phone  here...'),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ('Password here...'),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Confirm Password
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWrapper(
                          formField: TextFormField(
                            controller: controller.confirmPasswordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ('Confirm Password here...'),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                          position: TextFormFieldPosition.alone,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //Button Register
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        try{
                          controller.signUpWithEmailAndPassword();
                          controller.insertData();
                        }catch(e){
                          print(e);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD567CD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: Text(
                          "Log in",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 12),
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
