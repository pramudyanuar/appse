import 'package:flutter/material.dart';
import 'package:appse/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/changepass_controller.dart';

class ChangepassView extends GetView<ChangepassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Change Password'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.offAllNamed(Routes.PROFILE);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
              child: Column(
            children: [
              SizedBox(height: 16),
              Obx(() => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isHidden.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(controller.isHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.showPassword();
                        },
                      ),
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      labelText: 'Old Password',
                      hintText: 'Enter your old password',
                    ),
                  )),
              SizedBox(height: 16),
              Obx(() => TextFormField(
                    controller: controller.newpasswordController,
                    obscureText: controller.isHidden.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(controller.isHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.showPassword();
                        },
                      ),
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      labelText: 'New Password',
                      hintText: 'Enter your new password',
                    ),
                  )),
              SizedBox(height: 16),
              Obx(() => TextFormField(
                    controller: controller.confirmpasswordController,
                    obscureText: controller.isHidden.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(controller.isHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.showPassword();
                        },
                      ),
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your new password',
                    ),
                  )),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  controller.changePassword();
                },
                child: Text('Change Password',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          )),
        ));
  }
}
