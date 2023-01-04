import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/balance_amount_cubit/balance_amount_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceAmountCubit extends Cubit<BalanceAmountState> {
  final CreateBalanceCardRepo _repo;
  BalanceAmountCubit(this._repo) : super(BalanceAmountInitialState());

  late TextEditingController _controller;

  void initial() {
    _controller = TextEditingController();
    emit(BalanceAmountLoadedState(_controller, _repo.currentCurrencyData));
  }

  Future<void> saveInput() async {
    try {
      var num = 0.0;
      if (_controller.text.trim().isNotEmpty) {
        num = double.parse(_controller.text);
      }
      emit(BalanceAmountLoadingState());
      await _repo.saveInputAmount(num);
      emit(BalanceAmountCreateFinishState());
    } catch (er, st) {
      debugPrint('$er\n$st');
    }
  }
}
