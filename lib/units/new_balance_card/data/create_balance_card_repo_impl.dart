import 'package:expensive_tracker_app/units/new_balance_card/domian/create_balance_card_repo.dart';

class CreateBalanceCardRepoImpl implements CreateBalanceCardRepo {
  String _name = '';

  @override
  void changeName(String name) => _name = name;
  
}
