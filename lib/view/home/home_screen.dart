import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/widgets/audio_player.dart';
import 'package:itargs_challenge/core/widgets/toplikes_listview.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        // var openLikeBox = Hive.openBox('text_likes');
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('flutterTask'.tr),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildHeader('texts'.tr),
              ),
              const Divider(),
              TopLikesListView(cubit: cubit),
              const Divider(thickness: 2.5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildHeader('audio'.tr),
              ),
              const Divider(),
              Expanded(
                child: AudioPlayerWidget(cubit: cubit),
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
