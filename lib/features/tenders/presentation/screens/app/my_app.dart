import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_app/di/injected_bloc_provider.dart';
import 'package:tenders_app/features/tenders/presentation/screens/main_screen/main_screen.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        InjectedBlocProvider<TendersCubit>(),
        InjectedBlocProvider<TenderDetailsCubit>(),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}
