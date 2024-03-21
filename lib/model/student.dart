
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student{

final int id;
final String firstName;
final String lastName;
final String gender;


Student({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.gender,
});

factory Student.fromJson(Map<String, dynamic> json)=> _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

}