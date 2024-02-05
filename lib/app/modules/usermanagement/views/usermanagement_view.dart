import 'package:flutter/material.dart';
import 'package:appse/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/usermanagement_controller.dart';

class UsermanagementView extends GetView<UsermanagementController> {
  const UsermanagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('User Management'),
            centerTitle: true,
            backgroundColor: Colors.blue[100],
            leading: IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.ADMINPANEL);
              },
              icon: const Icon(Icons.arrow_back_ios),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'User List',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                    )),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    )),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: Stream.fromFuture(controller.getAllUsers()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      List<Map<String, dynamic>> usersData =
                          snapshot.data ?? [];
                      print(usersData);
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: usersData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red[100],
                                  child: const Icon(Icons.person),
                                ),
                                title: Text('${usersData[index]['name']}'),
                                subtitle: Text('${usersData[index]['email']}'),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                tileColor: Colors.blue[100],
                                trailing: usersData[index]['role'] == 'admin' ? Icon(Icons.verified) : null,
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
