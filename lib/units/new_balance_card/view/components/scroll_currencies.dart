import 'package:cached_network_image/cached_network_image.dart';
import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/helpers/crypto_logo_image.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ScrollCurrencies extends StatelessWidget {
  final List<CurrencyData> listOfCurrencies;
  const ScrollCurrencies(this.listOfCurrencies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Neumorphic(
        style: NeumorphicStyle(color: Theme.of(context).colorScheme.background),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final itemCurr = listOfCurrencies[index];
            return InkWell(
              onTap: () => context
                  .read<SearchCurrencyCubit>()
                  .selectCurrencyData(itemCurr),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemCurr.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    _LeadingCurrency(itemCurr),
                  ],
                ),
              ),
            );
          },
          itemCount: listOfCurrencies.length,
          separatorBuilder: (_, index) {
            return const Divider(height: 2, color: Color(0xFF9E9E9E));
          },
        ),
      ),
    );
  }
}

class _LeadingCurrency extends StatelessWidget {
  final CurrencyData currency;
  const _LeadingCurrency(this.currency);

  @override
  Widget build(BuildContext context) {
    if (currency.type == 0) {
      return Text(
        currency.code,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      );
    } else {
      return CryptoLogoIage(currency.symbol);
    }
  }
}
