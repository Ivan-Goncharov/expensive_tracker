import 'package:expensive_tracker_app/theme/cubit/themes_state.dart';

abstract class ThemesRepository {
  Future<ThemesState> getAppTheme();
}
