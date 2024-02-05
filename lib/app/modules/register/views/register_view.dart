import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import 'package:appse/app/routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 100, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LOGO
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.network(
                  'https://i.ibb.co/9c525nS/logo-removebg-preview.png',
                  height: 100,
                ),
                SizedBox(height: 16),
                Text(
                  'Register',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Register to your account',
                  style: TextStyle(fontSize: 16),
                ),
              ]),

              SizedBox(height: 16),

              //FORM
              Form(
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nrpController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.card_membership),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        labelText: 'NRP',
                        hintText: 'Enter your NRP',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        labelText: 'Name',
                        hintText: 'Enter your name',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 16),
                    Obx(
                      () => TextFormField(
                        obscureText: controller.isHidden.value,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () {
                              controller.showPassword();
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        controller.registerUser();
                      },
                      child: Text('Sign In',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text('Sign In'))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
