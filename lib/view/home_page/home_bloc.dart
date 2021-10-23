import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:namer/model/detect_object.dart';
import 'package:namer/repository/detect_object_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DetectObjectRepository _DetectObjectRepository;
  StreamSubscription? _HomeSubscription;

  HomeBloc({required DetectObjectRepository DetectObjectRepository})
      : _DetectObjectRepository = DetectObjectRepository,
        super(ObjectInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is UpdateSelection) {
      yield* _mapUpdateSelectionToState(event);
    }
    if (event is Changetitle) {
      {
        yield* _changeTitle(event);
      }
    }
  }

  Stream<HomeState> _changeTitle(Changetitle event) async* {
    yield titleChange(title: event.title);
  }

  Stream<HomeState> _mapUpdateSelectionToState(UpdateSelection event) async* {
    List<Map<String, dynamic>> object = [
      {
        'name': event.detectObject.name,
        'time': event.detectObject.time,
        'classfication': event.detectObject.classfication,
      }
    ];
    _HomeSubscription?.cancel();
    // _DetectObjectRepository.AddNewObject(
    //   object: object,
    // );
    // print(event.id);
    // print('event is : ${event}');
  }

  @override
  Future<void> close() {
    _HomeSubscription?.cancel();
    return super.close();
  }
}
