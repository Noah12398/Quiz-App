import 'package:hive/hive.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 0)
class Quiz {
  @HiveField(0)
  final String question;
  
  @HiveField(1)
  final List<String> options;
  
  @HiveField(2)
  final int answer;

  Quiz({
    required this.question,
    required this.options,
    required this.answer,
  });
}
