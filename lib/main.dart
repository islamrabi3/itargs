import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/language/translation.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/core/theme/theme_mode.dart';
import 'package:itargs_challenge/models/top_likes.dart';
import 'package:itargs_challenge/view/home_layout.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await CacheHelper.init();
  Hive.registerAdapter(TopLikesTextAdapter());
  var fromShared = CacheHelper.sharedPreferences!.getBool('isDark') ?? false;

  runApp(MyApp(
    isDark: fromShared,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark});

  final bool isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getAudioFileModel(apiUrl)
        ..toggleTheme(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            translations: LanguageTranslate(),
            locale: Locale(CacheHelper.sharedPreferences!.getString('code') ??
                Get.deviceLocale!.languageCode),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: AppTheme.getDarkTheme(),
            theme: AppTheme.getLightTheme(),
            themeMode: context.read<AppCubit>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
