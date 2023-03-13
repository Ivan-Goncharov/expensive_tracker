import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SearchCurrencyToggle extends StatelessWidget {
  final int selectIndex;
  const SearchCurrencyToggle(
    this.selectIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleSwitch(
              cornerRadius: 16,
              animate: true,
              animationDuration: 120,
              minWidth: 120,
              totalSwitches: 2,
              initialLabelIndex: selectIndex,
              inactiveBgColor: colors.background,
              borderColor: [colors.primary],
              borderWidth: 1,
              activeBgColor: [colors.primary],
              activeFgColor: colors.onPrimary,
              labels: const [
                SResources.currencyTitle,
                SResources.crytoCurrencyTitle,
              ],
              onToggle: (value) {
                print('DEBUG VAUE $value');
                context.read<SearchCurrencyCubit>().changeToogleSwitch(value!);
              }),
          // ),
        ],
      ),
    );
  }
}
