abstract class LiveOverviewStates {}

class InitialState extends LiveOverviewStates {}

class LiveState extends LiveOverviewStates {
  final Map<String, dynamic>? data;

  LiveState({this.data});
}
class MonthChangeed extends LiveOverviewStates{}
