part of 'api_cubit.dart';

abstract class ApiState {}

class ApiInitial extends ApiState {}
class DataLoadingState extends ApiState {}

class DataSucessState extends ApiState {}
class DataErrorState extends ApiState {}

