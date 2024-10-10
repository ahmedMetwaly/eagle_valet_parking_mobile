abstract class EmployerStates {}

class InitialEmployer extends EmployerStates {}

class EmployerLoading extends EmployerStates {
  final String progress;

  EmployerLoading({required this.progress});
}
class EmployerChanged extends EmployerStates {}

class EmployerAdded extends EmployerStates {}

class DeleteEmployer extends EmployerStates {}
class FailedGetEmployers extends EmployerStates {
  final String error;

  FailedGetEmployers({required this.error});
}
class SuccessGetEmployers extends EmployerStates {}
