// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:namer/model/detect_object.dart';
// import 'package:namer/repository/detect_object_repository.dart';

// part 'setting_event.dart';
// part 'setting_state.dart';

// class SettingBloc extends Bloc<SettingEvent, SettingState> {
//   final DetectObjectRepository _DetectObjectRepository;
//   StreamSubscription? _SettingSubscription;

//   SettingBloc({required DetectObjectRepository DetectObjectRepository})
//       : _DetectObjectRepository = DetectObjectRepository,
//         super(ObjectInitial());

//   @override
//   Stream<SettingState> mapEventToState(
//     SettingEvent event,
//   ) async* {
//     if (event is UpdateSelection) {
//       yield* _mapUpdateSelectionToState(event);
//     }
//     if (event is Changetitle) {
//       {
//         yield* _changeTitle(event);
//       }
//     }
//   }

//   Stream<SettingState> _changeTitle(Changetitle event) async* {
//     yield titleChange(title: event.title);
//   }

//   Stream<SettingState> _mapUpdateSelectionToState(UpdateSelection event) async* {
//     List<Map<String, dynamic>> object = [
//       {
//         'name': event.detectObject.name,
//         'time': event.detectObject.time,
//         'classfication': event.detectObject.classfication,
//       }
//     ];
//     _SettingSubscription?.cancel();
//     // _DetectObjectRepository.AddNewObject(
//     //   object: object,
//     // );
//     // print(event.id);
//     // print('event is : ${event}');
//   }

//   @override
//   Future<void> close() {
//     _SettingSubscription?.cancel();
//     return super.close();
//   }
// }
