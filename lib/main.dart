import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/constants/constants.dart';
import 'package:user_management/data/hive/hive_service.dart';
import 'package:user_management/persentation/views/home_view.dart';
import 'business_logic/cubits/users_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initial Hive DB
  await HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Constants.PRIMARY_COLOR,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
