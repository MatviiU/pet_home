import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';
import 'package:pet_home/features/home/presentation/widgets/empty_favorite_pets_view.dart';
import 'package:pet_home/features/home/presentation/widgets/main_grid_view.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/app_logo.jpg',
            width: 70,
            height: 70,
          ),
        ),
        title: const Text('Pet Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text: 'All pets'), Tab(text: 'My pets')],
          labelStyle: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [MainGridView(), EmptyFavoritePetsView()]),
    );
  }
}
