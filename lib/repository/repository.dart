abstract class Repository<T> {
  Future add(T item);

  Future<List<T>> getAll();
}