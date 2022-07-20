import 'package:dio/dio.dart';
import 'package:education_app/model/subject.dart';

class SubjectService {
  Future<List<Subject>?> getSubjects() async {
    const String subjectUrl = 'https://school.optimisttechhub.com/api/subjects';
    final Response response = await Dio(BaseOptions()).get(subjectUrl);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final subjectList = (response.data['data'] as List).map((e) {
        return Subject.fromJson(e);
      }).toList();

      return subjectList;
    }
  }
}
