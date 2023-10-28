import 'package:basicapp/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageBody> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Choose Date'),
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2022),
            lastDate: DateTime(2030),
          ).then((selectedDate) {
            if (selectedDate != null) {
              setState(() {
                date = selectedDate;
                var formattedDate = DateFormat('d-MMM-yy').format(selectedDate);
                DateTime dateTime = DateFormat("d-MMM-yy").parse(formattedDate);
                formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);
                GoRouter.of(context).push(Approute.kPhotos);
              });
            }
          });
        },
      ),
    );
  }
}
