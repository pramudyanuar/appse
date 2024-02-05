import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appse/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/scan_controller.dart';
import 'package:intl/intl.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text('LABSERVICES'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: controller.getStatus(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(child: Text('No data available'));
                          }

                          List<Map<String, dynamic>> status = snapshot
                              .data!.docs
                              .map((doc) => doc.data())
                              .toList();
                          var isOpen = status[0]['IsOpen'];
                          return Column(
                            children: [
                              Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, left: 12, right: 12, bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        isOpen
                                            ? 'Yeay RPL is Now Open!🎉'
                                            : 'Sorry Labse is Closed Now',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      if (isOpen)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Lecturers',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '5',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Admins',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '99',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Visitors',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              if (isOpen)
                                Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'You Have Been Here For:',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '2 Hours',
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                            ],
                          );
                        }),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Attendance History',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: controller.getHistory(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }

                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No data available'));
                              }

                              return Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          Map<String, dynamic> data = snapshot
                                              .data!.docs.reversed
                                              .toList()[index]
                                              .data();
                                          return ListTile(
                                              leading: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.white,
                                                child: Image(
                                                  image: NetworkImage(
                                                      "https://i.ibb.co/x10z1hf/subscribe.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              title: Text(data['date']),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Check In: ',
                                                          style: DefaultTextStyle
                                                                  .of(context)
                                                              .style,
                                                        ),
                                                        TextSpan(
                                                          text: "${DateFormat.jms().format(DateTime.parse(data['masuk']['date']))}",
                                                          style: TextStyle(
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Check Out: ',
                                                          style: DefaultTextStyle
                                                                  .of(context)
                                                              .style,
                                                        ),
                                                        TextSpan(
                                                          text: data['keluar'] !=
                                                                  null
                                                              ? "${DateFormat.jms().format(DateTime.parse(data['keluar']['date']))}"
                                                              : 'Has Not Out Yet',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ));
                                        })),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.getStatus(),
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

                  List<Map<String, dynamic>> status =
                      snapshot.data!.docs.map((doc) => doc.data()).toList();
                  var isOpen = status[0]['IsOpen'];
            return
            isOpen
                ? FloatingActionButton(
                    onPressed: () {
                      controller.presence();
                    },
                    child: Icon(Icons.fingerprint),
                    backgroundColor: Colors.blue[100],
                  )
                : FloatingActionButton(
                    onPressed: () {
                      Get.snackbar("Error", 'Sorry LABSE is Closed Now');
                    },
                    child: Icon(Icons.fingerprint),
                    backgroundColor: Colors.blue[100],
                  );
          }
        ));
  }
}
