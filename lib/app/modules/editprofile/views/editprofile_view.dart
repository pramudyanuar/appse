import 'package:appse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  final Map<String, dynamic> data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.nrp.text = data['nrp'];
    controller.name.text = data['name'];
    controller.email.text = data['email'];
    String defaultImage = 'https://ui-avatars.com/api/?name=${data['name']}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.PROFILE);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(defaultImage),
              ),
              SizedBox(height: 35),
        
              //FORM
              Form(
                child: Column(
                  children: [
                    TextField(
                      readOnly: true,
                      controller: controller.nrp,
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
                      controller: controller.name,
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
                      readOnly: true,
                      controller: controller.email,
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
                    ElevatedButton(
                      onPressed: () {
                        controller.updateProfile(data['uid']);
                      },
                      child: Text('Submit Changes',
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
            ],
          ),
        ),
      ),

    );
  }
}
