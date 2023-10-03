part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadingState extends AppState {}

class AppSuccess extends AppState {}

class AppError extends AppState {}

class LikeBtnPressed extends AppState {}
