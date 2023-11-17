import 'package:basicapp/Screens/home/widgets/date.dart';
import 'package:basicapp/Screens/home/widgets/photocard.dart';
import 'package:basicapp/bloc/mars_photo/mars_cubit.dart';
import 'package:basicapp/utils/theme/loadingwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarsCubit, MarsState>(
      builder: (context, state) {
        MarsCubit cubit = MarsCubit.get(context);
        return Column(
          children: [
            Date(cubit: cubit),
            state is MarsLoadding
                ? const Loadindwidget()
                : cubit.photos.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: cubit.photos.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PhotoCard(marsPhoto: cubit.photos[index]);
                          },
                        ),
                      )
                    : const Expanded(
                        child: Center(
                          child: Text("There is no photos"),
                        ),
                      ),
          ],
        );
      },
    );
  }
}
