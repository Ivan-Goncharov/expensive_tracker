import 'package:carousel_slider/carousel_slider.dart';
import 'package:expensive_tracker_app/get_it.dart';
import 'package:expensive_tracker_app/units/home/cubit/month_change_cubit.dart';
import 'package:expensive_tracker_app/units/home/cubit/month_change_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MonthView extends StatelessWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MonthChangeCubit>()..initial(),
      child: const _MonthViewBody(),
    );
  }
}

class _MonthViewBody extends StatelessWidget {
  const _MonthViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonthChangeCubit, MonthChangeState>(
      builder: ((context, state) {
        if (state is MonthChangeSuccesState) {
          final cubit = context.read<MonthChangeCubit>();
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            height: 40,
            width: double.infinity,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => cubit.onScrollLeft(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF9E9E9E),
                        )),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFF9E9E9E),
                      )),
                  padding: const EdgeInsets.all(4.0),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 40,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 40,
                      reverse: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, _) =>
                          context.read<MonthChangeCubit>().onPageChanged(index),
                    ),
                    carouselController: state.controller,
                    items: state.listOfDate.map((i) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        alignment: Alignment.center,
                        child: Text(
                          DateFormat('MMMM y').format(i),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                InkWell(
                  onTap: () => cubit.onScrollRight(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF9E9E9E),
                        )),
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
