import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class Loadindwidget extends StatelessWidget {
  const Loadindwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: const Color.fromARGB(41, 158, 158, 158),
              highlightColor: Colors.grey,
              child: ListTile(
                leading: Container(
                  width: MediaQuery.sizeOf(context).width * 0.09,
                  height: MediaQuery.sizeOf(context).width * 0.09,
                  color: Colors.grey,
                ),
                title: Container(
                  width: MediaQuery.sizeOf(context).width * 0.1,
                  height: MediaQuery.sizeOf(context).width * 0.1,
                  color: Colors.grey,
                ),
              ));
        },
      ),
    );
  }
}
