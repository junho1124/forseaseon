abstract class Repository<T> {
  void add(T item);

  Future<List<T>> getAll();
}