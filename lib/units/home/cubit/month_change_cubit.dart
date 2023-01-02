import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:expensive_tracker_app/units/home/cubit/month_change_state.dart';
import 'package:expensive_tracker_app/units/last_operationes/domain/repositories/month_repository.dart';

class MonthChangeCubit extends Cubit<MonthChangeState> {
  final MonthRepositoty monthRepo;
  MonthChangeCubit(this.monthRepo) : super(MonthChangeStateInitial());
  late CarouselController _controller;
  late List<DateTime> _listOfMonth;

  void initial() {
    _controller = CarouselController();
    _listOfMonth = monthRepo.listOfMonth;
    emit(MonthChangeSuccesState(
      _listOfMonth,
      _controller,
    ));
  }

  void onPageChanged(int page) {
    monthRepo.addMonthInStream(page);
  }

  void onScrollRight() {
    _controller.previousPage();
  }

  void onScrollLeft() {
    _controller.nextPage();
  }
}
