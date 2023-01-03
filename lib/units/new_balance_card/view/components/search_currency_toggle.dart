import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchCurrencyToggle extends StatelessWidget {
  final int selectIndex;
  const SearchCurrencyToggle(
    this.selectIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return NeumorphicToggle(
      style: NeumorphicToggleStyle(backgroundColor: colors.background),
      height: 50,
      selectedIndex: selectIndex,
      displayForegroundOnlyIfSelected: true,
      children: [
        ToggleElement(
          background: const Center(
              child: Text(
            "This week",
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
          foreground: const Center(
              child: Text(
            "This week",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
        ),
        ToggleElement(
          background: const Center(
              child: Text(
            "This month",
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
          foreground: const Center(
              child: Text(
            "This month",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
        ),
      ],
      thumb: Neumorphic(
        style: NeumorphicStyle(
          color: colors.background,
          boxShape: NeumorphicBoxShape.roundRect(
            const BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      onChanged: (value) =>
          context.read<SearchCurrencyCubit>().changeToogleSwitch(value),
    );
  }
}
