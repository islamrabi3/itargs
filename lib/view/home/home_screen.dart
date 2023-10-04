import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:itargs_challenge/core/app_string.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/models/top_likes.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        var openLikeBox = Hive.openBox('text_likes');
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(AppString.homeAppBarString),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildHeader('Top Likes Texts'),
              ),
              const Divider(),
              SizedBox(
                height: 400,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                maxHeight: 200,
                                maxWidth: 300,
                              ),
                              child: Text(
                                DUMMY_TOPLIKES[index].textSample!,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  cubit.whenLikePressed(index);
                                },
                                child: DUMMY_TOPLIKES[index].isLiked!
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(Icons.favorite_border))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: DUMMY_TOPLIKES.length),
              ),
              const Divider(thickness: 2.5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildHeader('Top Likes Audio'),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.playAudioAndPause();
                      },
                      child: cubit.isPlaying
                          ? SvgPicture.asset('assets/pause.svg')
                          : SvgPicture.asset('assets/play.svg'),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    const Text('Play The Audio')
                  ],
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        // TODO: implement listener
      },
    );
  }

  Widget buildHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}
