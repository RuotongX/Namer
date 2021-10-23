part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class titleChange extends HomeState {
  final String title;
  titleChange({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}

class ObjectInitial extends HomeState {
  final String title;
  ObjectInitial({this.title = ''});
  @override
  List<Object> get props => [title];
}

class ObjectSubmitionSuccess extends HomeState {}

class ObjectSubmitionFail extends HomeState {}

class ObjectSubmiting extends HomeState {}
