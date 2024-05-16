import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/business_logic/cubits/users_cubit.dart';
import 'package:user_management/business_logic/cubits/users_state.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/persentation/widgets/filters_dialog.dart';
import 'package:user_management/persentation/widgets/users_list_view.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSearch(context: context, delegate: CustomSearchDelegae());
      },
      icon: const Icon(Icons.search),
    );
  }
}

class CustomSearchDelegae extends SearchDelegate {
  List<UserModel> usersFilter = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
      FiltersDialog()
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
        close(context, null);
        BlocProvider.of<UsersCubit>(context).loadedUsers();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    BlocProvider.of<UsersCubit>(context).search(query);
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        usersFilter = BlocProvider.of<UsersCubit>(context).usersFilter;
        if (state is OnFilterUsersState || state is LoadedUsersState) {
          return UsersListView(users: usersFilter);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
