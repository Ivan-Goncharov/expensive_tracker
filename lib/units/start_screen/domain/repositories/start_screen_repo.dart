abstract class StartScreenRepo {
  bool isFirstStart();

  Future<void> saveStartInfo();

  Future<void> getAllCategories();
}
