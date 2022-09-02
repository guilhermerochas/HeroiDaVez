import 'package:heroi_da_vez/app/data/repositories/i_repository.dart';
import 'package:objectbox/objectbox.dart';

class GenericRepository<TEntity> implements IRepository<TEntity> {
  final Box<TEntity> _box;

  GenericRepository(Store store) : _box = store.box<TEntity>();

  @override
  void create(TEntity value) => _box.put(value);

  @override
  bool delete(int id) {
    var value = _box.remove(id);
    return value;
  }

  @override
  List<TEntity> getAll() => _box.getAll();

  @override
  TEntity getById(int id) {
    var value = _box.get(id) as TEntity;
    return value;
  }

  @override
  void update(TEntity value) => _box.put(value);
}
