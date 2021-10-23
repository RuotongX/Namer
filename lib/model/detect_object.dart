import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DetectObject extends Equatable {
  final String name;
  final String time;
  final String classfication;

  DetectObject({
    required this.name,
    required this.time,
    required this.classfication,
  });

  @override
  List<Object?> get props => [
        name,
        time,
        classfication,
      ];
  static DetectObject fromSnapshot(DocumentSnapshot snap) {
    DetectObject deob = DetectObject(
      name: snap['name'],
      time: snap['time'],
      classfication: snap['classfication'],
    );

    return deob;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'time': time,
        'classfication': classfication,
      };
}
