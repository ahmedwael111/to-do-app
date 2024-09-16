part of 'add_cubit_cubit.dart';

@immutable
sealed class AddCubitState {}

final class AddCubitInitial extends AddCubitState {}

class AddCubitSuccess extends AddCubitState {}
// final TaskModel newtask;
class AddCubitFuilur extends AddCubitState {
  final String errorMessage;

  AddCubitFuilur(this.errorMessage);
}
