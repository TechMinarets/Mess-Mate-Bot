import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/presentation/screen/notifier/table_notifier.dart';

class DataListView extends ConsumerStatefulWidget {
  const DataListView({super.key});

  @override
  ConsumerState<DataListView> createState() => _DataListViewState();
}

class _DataListViewState extends ConsumerState<DataListView> {
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
          child: ref.watch(tableNotifierProvider).when(
                loading: () => const CircularProgressIndicator(),
                success: (data) {
                  print(data);
                  return DataTable(
                    columns: List.generate(
                      data['table'].first.length,
                      (index) => DataColumn(
                        label: Text(
                          data['table'].first[index].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    rows: List.generate(
                      data['table'].length - 1,
                      (rowIndex) => DataRow(
                        cells: List.generate(
                          data['table'][rowIndex + 1].length,
                          (cellIndex) => DataCell(
                            Text(data['table'][rowIndex + 1][cellIndex]
                                .toString()),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                error: (message) => Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_chart,
                        size: 300,
                        color: Colors.green.shade400,
                      ),
                      Text('No table data created yet'),
                    ],
                  ),
                ),
              ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green.shade400,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 2),
          child: ref.watch(tableNotifierProvider).when(
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data) => Text(
                  data['total_expenses'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                error: (message) =>
                    Text(message, style: TextStyle(color: Colors.red)),
              ),
        ),
      ),
    );
  }
}
