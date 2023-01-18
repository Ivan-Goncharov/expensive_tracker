part of 'navigation_cubit.dart';

abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationChangePageState extends NavigationState {
  final int currentPage;
  final ScrollController scrollController;
  final List<ItemBalanceCardModel> listOfCards;
  final String selectIdCard;
  NavigationChangePageState({
    required this.currentPage,
    required this.scrollController,
    required this.listOfCards,
    required this.selectIdCard,
  });
}
