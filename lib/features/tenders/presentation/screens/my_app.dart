import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_app/di/injected_bloc_provider.dart';
import 'package:tenders_app/features/tenders/presentation/screens/main_screen/main_screen.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        InjectedBlocProvider<TendersCubit>(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.lightBlue[100],
                  surface: Colors.lightBlue[100],
                  background: Colors.white,
                )),
        home: const Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}
