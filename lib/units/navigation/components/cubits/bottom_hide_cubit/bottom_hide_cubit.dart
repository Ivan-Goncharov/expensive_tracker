import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'bottom_hide_state.dart';

class BottomHideCubit extends Cubit<BottomHideState> {
  BottomHideCubit() : super(BottomHideInitial());

  bool isHide = false;

  void initial(ScrollController scrollController) {
    emit(BottomHideChangeState(isHide));
    scrollController.addListener(
      () {
        final direction = scrollController.position.userScrollDirection;
        if (direction == ScrollDirection.forward) {
          show();
        } else if (direction == ScrollDirection.reverse) {
          hide();
        }
      },
    );
  }

  void hide() {
    if (!isHide) {
      isHide = true;
      emit(BottomHideChangeState(isHide));
    }
  }

  void show() {
    if (isHide) {
      isHide = false;
      emit(BottomHideChangeState(isHide));
    }
  }
}
