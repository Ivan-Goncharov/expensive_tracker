import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/balance_card_cubit/balance_card_cubit.dart';
import 'package:expensive_tracker_app/units/balance_cards/view/cubits/balance_card_cubit/balance_card_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../init_global.dart';

void main() {
  setupTests();

  setUp(() {
    print('setUp');
    EquatableConfig.stringify = true;
  });

  setUpAll(() {
    print('setUpAll');
  });

  blocTest<BalanceCardCubit, BalanceCardState>(
      'Balance card cubit test initial',
      build: () => getIt<BalanceCardCubit>(),
      act: (cubit) = > cubit.initial(),
      expect: () => []);
}
