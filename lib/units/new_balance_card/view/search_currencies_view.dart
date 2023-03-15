import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/helpers/default_app_bar.dart';
import 'package:expensive_tracker_app/i18n/translations.g.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/scroll_currencies.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/search_currency_toggle.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/components/search_text_field.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_cubit.dart';
import 'package:expensive_tracker_app/units/new_balance_card/view/cubits/search_currency_cubit/search_currency_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchCurrensiesView extends StatelessWidget {
  const SearchCurrensiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchCurrencyCubit>()..initial(),
      child: const _SearchCurrensiesBody(),
    );
  }
}

class _SearchCurrensiesBody extends StatelessWidget {
  const _SearchCurrensiesBody();
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: DefaultAppBar(title: t.strings.selectCurrencyTitle),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: BlocConsumer<SearchCurrencyCubit, SearchCurrencyState>(
          listener: (context, state) {
            if (state is SearchCurrencySelectState) {
              Navigator.of(context).pop();
            }
          },
          listenWhen: (_, current) {
            if (current is SearchCurrencySelectState) {
              return true;
            } else {
              return false;
            }
          },
          buildWhen: (_, current) {
            if (current is SearchCurrencySelectState) {
              return false;
            } else {
              return true;
            }
          },
          builder: (context, state) {
            if (state is SearchCurrencyChangeState) {
              return _SuccesefulSearchView(state);
            } else if (state is SearchCurrencyEmptyState) {
              /// TODO: Реализовать пустой список.
              return _EmptySearchView(state);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class _SuccesefulSearchView extends StatelessWidget {
  final SearchCurrencyChangeState state;
  const _SuccesefulSearchView(this.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchCurrencyToggle(state.selectToogleIndex),
        const SizedBox(height: 10),
        SearchCurrencyTextField(state.textController),
        const SizedBox(height: 10),
        ScrollCurrencies(state.listOfCurrency),
      ],
    );
  }
}

class _EmptySearchView extends StatelessWidget {
  final SearchCurrencyEmptyState state;
  const _EmptySearchView(this.state);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
