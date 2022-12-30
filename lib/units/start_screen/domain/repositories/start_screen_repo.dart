abstract class StartScreenRepo {
  Future<bool> isFirstStart();

  Future<void> saveStartInfo();

  Future<void> getAllCategories();
}
