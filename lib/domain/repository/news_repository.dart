abstract class NewsRepository {
  Future<Map<String, dynamic>> getNews();
  Future<Map<String, dynamic>> getNewsOffset(last_date);
  Future<Map<String, dynamic>> getNewsDetail(uuid);
}
