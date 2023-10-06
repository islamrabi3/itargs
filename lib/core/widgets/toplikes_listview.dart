import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/models/top_likes.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

class TopLikesListView extends StatelessWidget {
  const TopLikesListView({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
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
                      DUMMY_TOPLIKES[index].textSample!.tr,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        cubit.whenLikePressed(
                            index: index,
                            fromPrefs: CacheHelper.sharedPreferences!
                                .getBool('$index'));
                      },
                      child: CacheHelper.sharedPreferences!.getBool('$index') !=
                              null
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
    );
  }
}
