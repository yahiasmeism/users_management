import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/business_logic/cubits/users_cubit.dart';
import 'package:user_management/business_logic/cubits/users_state.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/persentation/widgets/search_widget.dart';
import 'package:user_management/persentation/widgets/shimmer_loading/shimmer_loading_list.dart';
import 'package:user_management/persentation/widgets/users_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserModel> users = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersCubit>(context).fetchUsersFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users Management'),
        actions: const [SearchWidget()],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is LoadingUsersState) {
            return const ShimmerLoadingList();
          } else if (state is LoadedUsersState) {
            users = BlocProvider.of<UsersCubit>(context).users;
            return UsersListView(users: users);
          } else {
            return _showErrorMessage();
          }
        },
      ),
    );
  }

  Widget _showErrorMessage() {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 50,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Oops there was an error , try later',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
