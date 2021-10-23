part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class Changetitle extends HomeEvent {
  final String title;

  Changetitle(this.title);

  @override
  List<Object> get props => [title];
}

class UpdateSelection extends HomeEvent {
  final DetectObject detectObject;

  UpdateSelection({
    required this.detectObject,
  });

  @override
  List<Object> get props => [detectObject];
}
