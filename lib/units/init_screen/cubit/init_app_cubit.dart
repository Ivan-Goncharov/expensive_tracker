import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'init_app_state.dart';

class InitAppCubit extends Cubit<InitAppState> {
  InitAppCubit() : super(InitAppInitial());

  Future<void> initial() async {
    emit(InitAppStartState());
    await Hive.initFlutter();
    
  }
}
