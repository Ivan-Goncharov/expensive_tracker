import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'float_button_vis_state.dart';

class FloatButtonVisCubit extends Cubit<FloatButtonVisState> {
  FloatButtonVisCubit() : super(FloatButtonVisInitial());

  bool isVisible = true;

  void initial(ScrollController scrollController) {
    emit(FloatButtonVisChangeState(isVisible));
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
    if (isVisible) {
      isVisible = false;
      emit(FloatButtonVisChangeState(isVisible));
    }
  }

  void show() {
    if (!isVisible) {
      isVisible = true;
      emit(FloatButtonVisChangeState(isVisible));
    }
  }
}
