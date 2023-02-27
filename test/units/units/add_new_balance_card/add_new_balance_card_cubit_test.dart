// ignore_for_file: unused_result

import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_cubit.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_state.dart';
import 'package:expensive_tracker_app/units/balance_cards/domain/repositories/currencies_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../init_global.dart';

void main() {
  setupTests();
  late CurrencyData currencyData;

  setUp(() => EquatableConfig.stringify = true);

  tearDownAll(() { 
    getIt<CurrenciesRepo>().dispose();
  });

  blocTest<AddNewBalanceCardCubit, AddNewBalanceCardState>(
    'Add new balance card cubit initial',
    build: () => getIt<AddNewBalanceCardCubit>(),
    act: (cubit) => cubit.initial(),
    expect: () => [
      AddNewBalanceCardLoadingState(),
      AddNewBalanceCardLoadedState(false),
    ],
  );

  blocTest<AddNewBalanceCardCubit, AddNewBalanceCardState>(
    'Add new balance card cubit test, [changeInputName]',
    build: () => getIt<AddNewBalanceCardCubit>(),
    act: (cubit) => cubit.changeInputName('New name'),
    expect: () => [],
  );

  blocTest<AddNewBalanceCardCubit, AddNewBalanceCardState>(
    'Add new balance card cubit test, [changeInputBalance]',
    build: () => getIt<AddNewBalanceCardCubit>(),
    act: (cubit) => cubit.changeInputBalance('24.0'),
    expect: () => [],
  );

  blocTest<AddNewBalanceCardCubit, AddNewBalanceCardState>(
    'Add new balance card cubit test, [listen currency]',
    build: () => getIt<AddNewBalanceCardCubit>(),
    act: (cubit) async {
      final repo = getIt<CurrenciesRepo>();
      currencyData = await repo.getCurrencyById(1); 
      cubit.listenerCurrencies(currencyData);
    },
    expect: () => [
      AddNewBalanceCardLoadedState(
        false,
        currencyData: currencyData,
      ),
    ],
  );

  blocTest<AddNewBalanceCardCubit, AddNewBalanceCardState>(
    'Add new balance card cubit test, [saveCard]',
    build: () => getIt<AddNewBalanceCardCubit>(),
    act: (cubit) async {
      final repo = getIt<CurrenciesRepo>();
      currencyData = await repo.getCurrencyById(1);
      cubit
        ..changeInputBalance('23')
        ..changeInputName('New card')
        ..listenerCurrencies(currencyData);
      cubit.saveCard();
    },
    expect: () => [
      AddNewBalanceCardLoadedState(true, currencyData:currencyData ),
      AddNewBalanceCardSucceful(),
    ],
  );
}
