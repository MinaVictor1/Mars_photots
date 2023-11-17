import 'package:basicapp/bloc/mars_photo/mars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  const Date({
    super.key,
    required this.cubit,
  });

  final MarsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Select date'),
      trailing: const Icon(Icons.calendar_month),
      onTap: () async {
        final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now());
        cubit.changedDate(selectedDate);
      },
      subtitle: cubit.selectedDate != null
          ? Text(DateFormat.yMMMMd().format(cubit.selectedDate!))
          : null,
    );
  }
}
