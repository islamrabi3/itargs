import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text('moreScreen'.tr),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader('setting'.tr),
                  const Divider(),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CacheHelper.sharedPreferences!.getString('code') == 'ar'
                            ? Text('english'.tr)
                            : Text('arabic'.tr),
                        Switch(
                          value: CacheHelper.sharedPreferences!
                                  .getBool('switch') ??
                              false,
                          onChanged: (value) {
                            cubit.toggleLanguage(value);
                          },
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CacheHelper.sharedPreferences!.getBool('isDark') ?? true
                            ? Text('light'.tr)
                            : Text('dark'.tr),
                        Switch(
                          value: cubit.isDark,
                          onChanged: (value) => cubit.toggleTheme(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
