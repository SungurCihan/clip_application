import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_page_route_state.dart';

class BottomPageRouteCubit extends Cubit<BottomPageRouteState> {
  BottomPageRouteCubit() : super(const BottomPageRouteState());

  void indexChanged(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
