part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadingState extends AppState {}

class AppSuccessState extends AppState {}

class AppErrorState extends AppState {}

class LikeBtnPressed extends AppState {}
