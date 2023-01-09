// ignore_for_file: file_names
import 'package:bloc/bloc.dart';
import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/create_name_cubit/cubit/create_card_name_state.dart';
import 'package:flutter/material.dart';

class CreateCardNameCubit extends Cubit<CreateCardNameState> {
  final CreateBalanceCardRepo _repo;
  CreateCardNameCubit(this._repo) : super(CreateCardNameInitialState());

  late TextEditingController _textEditingController;
  var _isShowButton = true;

  Future<void> initial() async {
    emit(CreateCardNameLoadingState());
    _textEditingController = TextEditingController(text: 'New card');
    _textEditingController.addListener(_controllerListener);
    emit(CreateCardNameSuccesState(_textEditingController, _isShowButton));
  }

  void _controllerListener() {
    if (_textEditingController.text.isEmpty && _isShowButton) {
      _isShowButton = false;
      emit(CreateCardNameSuccesState(_textEditingController, _isShowButton));
    } else if (_textEditingController.text.isNotEmpty && !_isShowButton) {
      _isShowButton = true;
      emit(CreateCardNameSuccesState(_textEditingController, _isShowButton));
    }
  }

  void saveInput() {
    /// TODO: Реализовать сохранение имени и переход на следующий экран.
    if (_textEditingController.text.trim().isNotEmpty) {
      _repo.changeName(_textEditingController.text);
      emit(CreateCardNameFinishState());
    } else {
      /// TODO: Реализовать тоаст о том, что не может быть поле пустым
    }
  }
}
