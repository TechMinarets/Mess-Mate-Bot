import 'package:flutter/material.dart';

class DataListView extends StatelessWidget {
  DataListView({
    Key? key,
  }) : super(key: key);
  List<List<dynamic>> data = [
    ['Item', 'Entry Date', 'Expense(Tk)'],
    ['Rice', '12-02-24', '230'],
    ['Egg', '12-02-24', '120'],
    ['Potato', '12-02-24', '80'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Table',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Row(
                  children: data[index]
                      .map<Widget>((item) => Expanded(
                            child: Text(
                              '$item',
                              textAlign: TextAlign.center,
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: kToolbarHeight,
        color: Colors.green.shade400,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 2),
          child: Text(
            'Total Expense: 430 Tk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
