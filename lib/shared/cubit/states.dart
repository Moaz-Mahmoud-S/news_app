import 'package:bloc/bloc.dart';

abstract class NewsAppStates {}

class NewsAppInitialState extends NewsAppStates {}

class NewsAppBottomNavState extends NewsAppStates {}

class NewsgetbusinesssucessState extends NewsAppStates {}

class NewsgetbusinessfailedState extends NewsAppStates {
  final String error;

  NewsgetbusinessfailedState(this.error);
}

class NewsloadingState extends NewsAppStates {}

class NewsgetsceincesucessState extends NewsAppStates {}

class NewsgetsceincefailedState extends NewsAppStates {
  final String error;

  NewsgetsceincefailedState(this.error);
}

class NewsgetsportsucessState extends NewsAppStates {}

class NewsgetsportfailedState extends NewsAppStates {
  final String error;

  NewsgetsportfailedState(this.error);
}

class NewsAppModeChange extends NewsAppStates {}
class NewsloadingSearchState extends NewsAppStates {}
class NewsgetsearchsucessState extends NewsAppStates {}
class NewsgetsearchfailedState extends NewsAppStates
{
  final String error;
  NewsgetsearchfailedState(this.error);
}
class NewsAppSearchState extends NewsAppStates {}