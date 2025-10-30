//
// ignore: one_member_abstracts
abstract class SearchableBaseRepository<T> {
  Future<List<T>> search(String query);
}
