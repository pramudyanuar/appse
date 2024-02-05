import 'package:flutter/material.dart';
import 'package:appse/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/addnews_controller.dart';

class AddnewsView extends GetView<AddnewsController> {
  const AddnewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Add News'),
            centerTitle: true,
            backgroundColor: Colors.blue[100],
            leading: IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.ADMINPANEL);
              },
              icon: Icon(Icons.arrow_back_ios),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 20,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
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

              //form

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: controller.title,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.title),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        labelText: 'Title',
                        hintText: 'Enter your title',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.imageLink,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.link),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        labelText: 'Image URL',
                        hintText: 'Enter your URL',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.description,
                      maxLines: 10,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.short_text_sharp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        labelText: 'Description',
                        hintText: 'Enter your Description',
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        controller.addNews();
                      },
                      child: Text('Upload News',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                )),
              )
            ],
          ),
        ));
  }
}
