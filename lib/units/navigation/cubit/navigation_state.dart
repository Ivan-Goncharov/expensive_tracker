part of 'navigation_cubit.dart';

abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationChangePageState extends NavigationState {
  final int currentPage;
  final ScrollController scrollController;
  NavigationChangePageState(this.currentPage, this.scrollController);
}
