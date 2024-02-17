import 'package:flutter/material.dart';

class DataListView extends StatelessWidget {
  DataListView({
    Key? key,
  }) : super(key: key);

  List<List<dynamic>> data = [
    ['Item', 'Entry Date', 'Expense(Tk)', 'Expense(Tk)'],
    ['Rice', '12-02-24', '230', '230'],
    ['Fish', '12-02-24', '120', '120'],
    ['Egg', '12-02-24', '120', '120'],
    ['Potato', '12-02-24', '80', '80'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Expense Table',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: DataTable(
            columns: List.generate(
              data.first.length,
              (index) => DataColumn(
                label: Text(
                  data.first[index].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            rows: List.generate(
              data.length - 1,
              (rowIndex) => DataRow(
                cells: List.generate(
                  data[rowIndex + 1].length,
                  (cellIndex) => DataCell(
                    Text(data[rowIndex + 1][cellIndex].toString()),
                  ),
                ),
              ),
            ),
          ),
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
