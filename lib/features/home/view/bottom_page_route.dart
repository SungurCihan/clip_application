import '../../../core/extensions/context_extension.dart';
import '../cubit/bottom_page_route_cubit.dart';
import 'account_view.dart';
import 'appointment_view.dart';
import 'home_view.dart';
import 'search_view.dart';
import '../../../product/widgets/card/logo.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class BottomPageRoute extends StatefulWidget {
  const BottomPageRoute({Key? key}) : super(key: key);

  @override
  State<BottomPageRoute> createState() => _BottomPageRouteState();
}

class _BottomPageRouteState extends State<BottomPageRoute> {
  late PageController _pageController;

  List<Widget> pages = [
    const HomeView(),
    const SearchView(),
    const AppointmentView(),
    const AccountView()
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomPageRouteCubit(),
      child: Scaffold(
        extendBody: true,
        body: BlocBuilder<BottomPageRouteCubit, BottomPageRouteState>(
          builder: (context, state) {
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                context.read<BottomPageRouteCubit>().indexChanged(index);
              },
              controller: _pageController,
              children: [...pages],
            );
          },
        ),
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: _appBar(context),
      ),
    );
  }

  Container _bottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BlocBuilder<BottomPageRouteCubit, BottomPageRouteState>(
          builder: (context, state) {
            return FlashyTabBar(
              selectedIndex: state.selectedIndex ?? 0,
              showElevation: true,
              onItemSelected: (index) {
                context.read<BottomPageRouteCubit>().indexChanged(index);
                _pageController.jumpToPage(index);
              },
              items: [
                FlashyTabBarItem(
                  activeColor: context.colorScheme.primary,
                  icon: const Icon(IconlyLight.home),
                  title: const Text('Ana Sayfa'),
                ),
                FlashyTabBarItem(
                  activeColor: context.colorScheme.primary,
                  icon: const Icon(IconlyLight.search),
                  title: const Text('Arama'),
                ),
                FlashyTabBarItem(
                  activeColor: context.colorScheme.primary,
                  icon: const Icon(IconlyLight.calendar),
                  title: const Text('Clip'),
                ),
                FlashyTabBarItem(
                  activeColor: context.colorScheme.primary,
                  icon: const Icon(IconlyLight.profile),
                  title: const Text('Hesabım'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: context.colorScheme.background,
        title: Center(
            child: SizedBox(height: context.height * 7, child: const Logo())));
  }
}
