abstract class IRepository<TEntity> {
  List<TEntity> getAll();
  TEntity getById(int id);
  void create(TEntity value);
  void update(TEntity value);
  bool delete(int id);
}
