import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LABSE'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Column(
                  children: [
                    Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                          ),
                        )),
                    SizedBox(height: 60),
                  ],
                ),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    )),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    )),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/MVKj9sd/118662878-361234191559380-5060323126084684489-n.jpg"),
                          fit: BoxFit.cover)),
                ),
              ]),
              SizedBox(height: 10),
              Text(
                'LABSE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                'Laboratory of Software Engineering',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.linkedinIn)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.web_rounded)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w900)),
                        Text(
                            'This laboratory offers areas of interest that focus on software testing skills, the ability to manage software projects, the ability to reduce the risk of software errors, and the ability to create game software.')
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LABSE specialty courses include:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w900)),
                        Text(
                            '1. Software Quality Assurance\n2. Software Architecture\n3. Software Evolution\n4. Software Construction\n5. Software Process Improvement\n6. Software Engineering Economics\n7. RPL Special Topics.')
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Facilities',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w900)),
                          Text(
                              "1. Intel Core i3 Gen-3, i5 Gen-8, up to Intel® Xeon® E5-2640 processor with 4GB-16GB RAM.\n2. For most HDDs the minimum is 1TB.\n3. All monitors measure 19″ to make it easier for students to carry out research and learn software engineering or programming.\n4. Equipped with a 55″ LED TV for students to carry out learning demonstrations.")
                        ]),
                    SizedBox(height: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Research and Development',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w900)),
                          Text(
                              "1. Detect Grouped Bot Activity in Parallel to Improve Computer Network Security\n2. Development of a Drone Forensic Framework using Log Analysis Techniques on Drone Device Log Data Artifacts\n3. Detection and Location of Possible Steganographic Payload in Spatial Domain\n4. Object Recognition in Multi-Camera Streaming Video Using Resource-Aware Framework\n5. Data and computer network security protection mechanisms\n6. Sensor Placement Strategy for Leak Detection in Water Pipe Networks Using Genetic Algorithms\n7. Anomaly Detection in Drone Forensic Time\n8. Intelligent Cyber Attack Detection System based on Recurrent Neural Network with Dirty Training Data\netc.")
                        ]),
                    SizedBox(height: 10),
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: controller.getLecturer(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No data available'));
                        }

                        List<Map<String, dynamic>> lecturers = snapshot
                            .data!.docs
                            .map((doc) => doc.data())
                            .toList();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lecturer',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w900),
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) => ListTile(
                                title: Text(lecturers[index]['Name'] ?? ''),
                                subtitle:
                                    Text(lecturers[index]['Position'] ?? ''),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://ui-avatars.com/api/?name=${lecturers[index]['Initial']}",
                                  ),
                                ),
                              ),
                              itemCount: lecturers.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                          ],
                        );
                      },
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Admin',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w900)),
                          ListView.builder(
                              itemBuilder: (context, index) => ListTile(
                                    title: Text('Nurul Hidayah'),
                                    subtitle: Text('Class Of 2020'),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://ui-avatars.com/api/?name=Ruli+Manurung"),
                                    ),
                                  ),
                              itemCount: 3,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics())
                        ]),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
