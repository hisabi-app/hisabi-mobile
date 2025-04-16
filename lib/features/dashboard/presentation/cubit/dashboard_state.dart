import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  DashboardLoaded(this.data);
  final data;
  @override
  List<Object?> get props => [data];
}

class DashboardError extends DashboardState {
  DashboardError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
