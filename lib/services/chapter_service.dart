import 'package:dio/dio.dart';
import 'package:education_app/model/chapter.dart';

class ChapterService {
  Future<List<Chapter>?> getChapters() async {
    String chapterUrl = 'https://school.optimisttechhub.com/api/chapters/1';
    final Response response = await Dio(BaseOptions()).get(chapterUrl);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final chapterList = (response.data['data'] as List).map((e) {
        return Chapter.fromJson(e);
      }).toList();

      return chapterList;
    }
  }
}
