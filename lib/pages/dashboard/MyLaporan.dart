import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';

class MyLaporan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.234,
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                // margin: EdgeInsets.only(left: 40, right: 40, top: 20),

                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/istock-default.jpg',
                        width: 130,
                        height: 130,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(width: 2))),
                        child: Text(
                          'Judul Laporan',
                          style: headerStyle(level: 4),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color: warningColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  border: const Border.symmetric(
                                      vertical: BorderSide(width: 1))),
                              alignment: Alignment.center,
                              child: Text(
                                'Posted',
                                style: headerStyle(level: 5, dark: false),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(5)),
                                  border: const Border.symmetric(
                                      vertical: BorderSide(width: 1))),
                              alignment: Alignment.center,
                              child: Text(
                                '17/06/2023',
                                style: headerStyle(level: 5, dark: false),
                              ),
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
    );
  }
}
