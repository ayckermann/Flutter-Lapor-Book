import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardFull();
  }
}

class DashboardFull extends StatefulWidget {
  const DashboardFull({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardFull();
}

class _DashboardFull extends State<DashboardFull> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add, size: 35),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Lapor Book', style: header2),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/istock-default.jpg'),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(width: 2))),
                        child:
                            Text('Judul Laporan', style: headerStyle(level: 2)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              decoration: BoxDecoration(
                                  color: warningColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  border: const Border.symmetric(
                                      vertical: BorderSide(width: 1))),
                              alignment: Alignment.center,
                              child: Text('Posted',
                                  style: headerStyle(level: 3, dark: false)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(5)),
                                  border: const Border.symmetric(
                                      vertical: BorderSide(width: 1))),
                              alignment: Alignment.center,
                              child: Text('17/06/2023',
                                  style: headerStyle(level: 3, dark: false)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
