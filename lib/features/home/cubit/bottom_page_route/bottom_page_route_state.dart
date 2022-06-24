part of 'bottom_page_route_cubit.dart';

class BottomPageRouteState extends Equatable {
  final int? selectedIndex;

  const BottomPageRouteState({this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];

  BottomPageRouteState copyWith({
    int? selectedIndex,
  }) {
    return BottomPageRouteState(selectedIndex: selectedIndex ?? 00);
  }
}
