import 'package:flutter/material.dart';
import 'package:appse/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/adminpanel_controller.dart';

class AdminpanelView extends GetView<AdminpanelController> {
  
  const AdminpanelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.offAllNamed(Routes.PROFILE);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Text('ADMIN PANEL'),
              Icon(Icons.admin_panel_settings_outlined)
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Obx(() => ListTile(
                      title: Text('Laboratory Status'),
                      onTap: () {
                        //UPDATE STATUS
                      },
                      trailing: Switch(
                        value: controller.status.value,
                        onChanged: (value) {
                          controller.updateStatus(value);
                        },
                      ),
                    )),
                ListTile(
                  title: Text('User Management'),
                  onTap: () {
                    Get.offAllNamed(Routes.USERMANAGEMENT);
                  },
                ),
                ListTile(
                  title: Text('Add News'),
                  onTap: () {
                    Get.offAllNamed(Routes.ADDNEWS);
                  },
                ),
                ListTile(
                  title: Text('Add Course'),
                  onTap: () {
                    Get.offAllNamed(Routes.ADDCOURSE);
                  },
                ),
                ListTile(
                  title: Text('Add Training'),
                  onTap: () {
                    Get.offAllNamed(Routes.ADDTRAINING);
                  },
                ),
              ],
            )));
  }
}
