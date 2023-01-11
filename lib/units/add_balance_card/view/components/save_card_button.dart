import 'package:expensive_tracker_app/constants/string_constants.dart';
import 'package:expensive_tracker_app/units/add_balance_card/cubit/add_new_balance_card_cubit.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class SaveCardButton extends StatelessWidget {
  final bool isShowButton;
  const SaveCardButton(this.isShowButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isShowButton ? 40 : 0,
      duration: const Duration(milliseconds: 200),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: 6,
          color: Theme.of(context).colorScheme.background,
          shape: NeumorphicShape.flat,
        ),
        child: InkWell(
          onTap: () => context.read<AddNewBalanceCardCubit>().saveCard(),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: 40,
            child: const Text(
              SResources.saveButton,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
