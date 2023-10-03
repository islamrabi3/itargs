import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_challenge/models/top_likes.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static BlocProvider get(BuildContext context) => BlocProvider.of(context);

  bool isLiked = false;

  whenLikePressed(index) {
    isLiked = !isLiked;
    DUMMY_TOPLIKES[index].isLiked = isLiked;
    print(DUMMY_TOPLIKES[index].isLiked!);
    emit(LikeBtnPressed());
  }
}
