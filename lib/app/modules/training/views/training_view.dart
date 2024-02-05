import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/training_controller.dart';

class TrainingView extends GetView<TrainingController> {
  const TrainingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
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
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Training',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            Image(
                              image: NetworkImage(
                                  "https://i.ibb.co/x10z1hf/subscribe.png"),
                              fit: BoxFit.fill,
                            )
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
                      color: Colors.red,
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
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: StreamBuilder(
                  stream: controller.getTraining(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No data available'));
                    }

                    List<Map<String, dynamic>> course =
                        snapshot.data!.docs.map((doc) => doc.data()).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: course.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: Colors.pink,
                              contentPadding: EdgeInsets.all(10),
                              leading: Image.network(
                                course[index]['ImageLink'] ?? 'https://i.ibb.co/9c525nS/logo-removebg-preview.png',
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                              title: Text(course[index]['titleCourse'] ?? ''),
                              subtitle: Text(course[index]['descCourse'] ?? ''),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            SizedBox(height: 10)
                          ],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
