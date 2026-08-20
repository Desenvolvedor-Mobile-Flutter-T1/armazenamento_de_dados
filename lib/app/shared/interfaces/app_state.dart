sealed class AppState {}

final class AppInitialState extends AppState {}

final class AppLoadingState extends AppState {}

final class AppSuccessState<T> extends AppState {
  final T sucessData;
  AppSuccessState({required this.sucessData});
}

final class AppErrorState extends AppState {
  final String message;
  AppErrorState({required this.message});
}
