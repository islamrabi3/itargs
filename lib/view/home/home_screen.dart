import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_challenge/core/app_string.dart';
import 'package:itargs_challenge/models/top_likes.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
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
                                  cubit.whenLikePressed(
                                      index);
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
