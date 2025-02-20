
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/features/community/ui/screens/community_screen.dart';
import 'package:aqartech/features/favorite/ui/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/style/colors/colors.dart';
import '../../../home/logic/home_cubit.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../../../profile/ui/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  final int? initialPage;

  MainScreen({Key? key, required this.initialPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit()..selectTab(initialPage ?? 0),
      child: _MainScreenContent(),
    );
  }
}

class _MainScreenContent extends StatefulWidget {
  @override
  _MainScreenContentState createState() => _MainScreenContentState();
}

class _MainScreenContentState extends State<_MainScreenContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static final List<Widget> _screens = [
    HomeScreenWithState(),
    CommunityScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        // Use addPostFrameCallback to ensure jumpToPage is called after the first frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_pageController.hasClients) {
            _pageController.jumpToPage(selectedIndex);
          }
        });

        return Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              context.read<NavigationCubit>().selectTab(index);
            },
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/core/house.png')),
                label: context.translate(LangKeys.home),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/core/Community.png')),
                label: context.translate(LangKeys.community),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/core/Favorite.png')),
                label: context.translate(LangKeys.favorites),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/core/More.png')),
                label: context.translate(LangKeys.more),
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: ColorsManager.mainColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<NavigationCubit>().selectTab(index);
            },
          ),
        );
      },
    );
  }
}

class NavigationCubit extends Cubit<int> {
  String? initialSearchQuery;

  NavigationCubit() : super(0);

  void selectTab(int index, {String? searchQuery}) {
    if (index == 1) {
      initialSearchQuery = searchQuery;
    } else {
      initialSearchQuery = null;
    }
    emit(index);
  }
}




// class SearchScreenWithState extends StatefulWidget {
//   @override
//   _SearchScreenWithStateState createState() => _SearchScreenWithStateState();
// }
//
// class _SearchScreenWithStateState extends State<SearchScreenWithState>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // This ensures the state is kept alive
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => getIt<CityCubit>()..getCities()),
//         BlocProvider(create: (context) => getIt<DistrictCubit>()),
//         BlocProvider(create: (context) => getIt<SearchCubit>()),
//       ],
//       child: SearchScreen(),
//     );
//   }
// }


// class ProfileScreenWithState extends StatefulWidget {
//   @override
//   _ProfileScreenWithStateState createState() => _ProfileScreenWithStateState();
// }
//
// class _ProfileScreenWithStateState extends State<ProfileScreenWithState>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // This ensures the state is kept alive
//     return  BlocProvider(
//       create: (context) => getIt<ProfileCubit>()..getUserInfo(),
//       child: const ProfileScreen(),
//     );
//   }
// }


class HomeScreenWithState extends StatefulWidget {
  @override
  _HomeScreenWithStateState createState() => _HomeScreenWithStateState();
}

class _HomeScreenWithStateState extends State<HomeScreenWithState>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // This ensures the state is kept alive
    return  BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: HomeScreen(),
    );
  }
}