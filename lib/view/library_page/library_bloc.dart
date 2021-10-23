// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:namer/model/detect_object.dart';
// import 'package:namer/repository/detect_object_repository.dart';

// part 'library_event.dart';
// part 'library_state.dart';

// class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
//   final DetectObjectRepository _DetectObjectRepository;
//   StreamSubscription? _LibrarySubscription;

//   LibraryBloc({required DetectObjectRepository DetectObjectRepository})
//       : _DetectObjectRepository = DetectObjectRepository,
//         super(ObjectInitial());

//   @override
//   Stream<LibraryState> mapEventToState(
//     LibraryEvent event,
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

//   Stream<LibraryState> _changeTitle(Changetitle event) async* {
//     yield titleChange(title: event.title);
//   }

//   Stream<LibraryState> _mapUpdateSelectionToState(UpdateSelection event) async* {
//     List<Map<String, dynamic>> object = [
//       {
//         'name': event.detectObject.name,
//         'time': event.detectObject.time,
//         'classfication': event.detectObject.classfication,
//       }
//     ];
//     _LibrarySubscription?.cancel();
//     // _DetectObjectRepository.AddNewObject(
//     //   object: object,
//     // );
//     // print(event.id);
//     // print('event is : ${event}');
//   }

//   @override
//   Future<void> close() {
//     _LibrarySubscription?.cancel();
//     return super.close();
//   }
// }
