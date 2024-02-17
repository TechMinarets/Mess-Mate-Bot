import 'package:flutter/material.dart';
import 'package:messmatebot/presentation/route_manager/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // Map<String, double> dataMap = {
  //   "Grocery": 12000,
  //   "Business": 15000,
  //   "Bills": 4000,
  //   "Tour Cost": 2000,
  // };
  // final List<Color> colorList = [
  //   Colors.blue,
  //   Colors.green,
  //   Colors.red,
  //   Colors.orange,
  //   Colors.purple,
  //   Colors.yellow,
  // ];

  Widget build(BuildContext context) {
    TextEditingController categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/rezvi.jpg'),
          ),
        ),
        title: const Text('Welcome Back Rezvi ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // PieChart(
                //   dataMap: dataMap,
                //   animationDuration: Duration(milliseconds: 800),
                //   chartLegendSpacing: 32,
                //   chartRadius: MediaQuery.of(context).size.width / 3.2,
                //   colorList: colorList,
                //   initialAngleInDegree: 0,
                //   chartType: ChartType.ring,
                //   ringStrokeWidth: 32,
                //   centerText: "",
                //   legendOptions: LegendOptions(
                //     showLegendsInRow: false,
                //     legendPosition: LegendPosition.right,
                //     showLegends: true,
                //     legendShape: BoxShape.circle,
                //     legendTextStyle: TextStyle(
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   chartValuesOptions: ChartValuesOptions(
                //     showChartValueBackground: true,
                //     showChartValues: true,
                //     showChartValuesInPercentage: false,
                //     showChartValuesOutside: false,
                //     decimalPlaces: 1,
                //   ),
                //   // gradientList: ---To add gradient colors---
                //   // emptyColorGradient: ---Empty Color gradient---
                // ),
                const SizedBox(height: 20),
                Text(
                  'Your Categories are:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    RouteManager.of(context).goToChatBotPage();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => ChatBotPage(),
                    // ));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.book, size: 40),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grocery Expanses',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Total : 12000Tk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete Category',
                                      'Edit Category Name'
                                    ]
                                        .map(
                                          (e) => InkWell(
                                            onTap: () async {
                                              if (e == 'Delete') {
                                                // await FirestoreMethods()
                                                //     .deletePost(widget.snap['postId']);
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    RouteManager.of(context).goToChatBotPage();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => ChatBotPage(),
                    // ));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.book, size: 40),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Business',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Total : 12000Tk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete Category',
                                      'Edit Category Name'
                                    ]
                                        .map(
                                          (e) => InkWell(
                                            onTap: () async {
                                              if (e == 'Delete') {
                                                // await FirestoreMethods()
                                                //     .deletePost(widget.snap['postId']);
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    RouteManager.of(context).goToChatBotPage();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => ChatBotPage(),
                    // ));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.book, size: 40),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bills',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Total : 12000Tk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete Category',
                                      'Edit Category Name'
                                    ]
                                        .map(
                                          (e) => InkWell(
                                            onTap: () async {
                                              if (e == 'Delete') {
                                                // await FirestoreMethods()
                                                //     .deletePost(widget.snap['postId']);
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    RouteManager.of(context).goToChatBotPage();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => ChatBotPage(),
                    // ));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.book, size: 40),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tour Cost',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Total : 12000Tk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete Category',
                                      'Edit Category Name'
                                    ]
                                        .map(
                                          (e) => InkWell(
                                            onTap: () async {
                                              if (e == 'Delete') {
                                                // await FirestoreMethods()
                                                //     .deletePost(widget.snap['postId']);
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                ),
                child: SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Add New Category',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: TextField(
                            controller: categoryController,
                            decoration: InputDecoration(
                              hintText: 'Category Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ), // Adjust the radius as needed
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    16.0, // Adjust the padding as needed
                                vertical: 12.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ), // Adjust the radius as needed
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                ), // Adjust the padding as needed
                                child: Text(
                                  'Create',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }
}
