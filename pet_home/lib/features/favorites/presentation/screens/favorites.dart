import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';
import 'package:pet_home/core/widgets/avatar.dart';
import 'package:pet_home/features/favorites/presentation/widgets/favorite_grid_view.dart';
import 'package:pet_home/features/favorites/presentation/widgets/pet_counter.dart';
import 'package:pet_home/features/settings/presentation/widgets/settings_button.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
        title: const Text('Favorite'),
        centerTitle: true,
        actions: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state.status == AppStatus.authenticated) {
                return SettingsButton(user: state.user);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.status == AppStatus.authenticated) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 60, 16, 0),
                    child: AvatarWidget(user: state.user),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FavoritePetCounter(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Text(
                      'My pets',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                  sliver: FavoriteGridView(),
                ),
              ],
            );
          }
          return Center(
            child: Text(
              'Please log in to see your profile.',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          );
        },
      ),
    );
  }
}
