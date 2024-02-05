import 'package:appse/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: controller.streamUser(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                Map<String, dynamic> data = snap.data!.data()!;
                String defaultImage =
                    'https://ui-avatars.com/api/?name=${data['name']}';
                return Column(
                  children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            color: Colors.blue[100],
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 10),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(defaultImage),
                                fit: BoxFit.cover)),
                      ),
                    ]),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data['name']}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 5),
                        if (data['role'] == 'admin')
                          Icon(
                            Icons.verified,
                            color: Colors.blue[900],
                          ),
                      ],
                    ),
                    Text(
                      '${data['email']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Total Scans',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${data['level']}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Level',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          if(data['role'] == 'admin')
                          ListTile(
                            leading: Icon(
                              Icons.admin_panel_settings,
                              color: Colors.blue[900],
                            ),
                            title: Text(
                              'Admin Panel',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[900],
                            ),
                            onTap: () {
                              Get.offAllNamed(Routes.ADMINPANEL,
                                  arguments: data);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.blue[900],
                            ),
                            title: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[900],
                            ),
                            onTap: () {
                              Get.offAllNamed(Routes.EDITPROFILE,
                                  arguments: data);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.key,
                              color: Colors.blue[900],
                            ),
                            title: Text(
                              'Change Password',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[900],
                            ),
                            onTap: () {
                              Get.offAllNamed(Routes.CHANGEPASS);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.blue[900],
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[900],
                            ),
                            onTap: () {
                              controller.logOut();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ],
      )),
    );
  }
}
