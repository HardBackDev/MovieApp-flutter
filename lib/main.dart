import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubits/movie_cubit.dart';
import 'package:movieapp/movie_observer.dart';
import 'package:movieapp/overrides/ignore_ssl.dart';
import 'package:provider/provider.dart';

import 'pages/navigation_page.dart';
import 'states/some_state.dart';

void main() {
  HttpOverrides.global = IgnoreSSL();
  Bloc.observer = MovieObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
    return ChangeNotifierProvider(
      create: (context) => SomeState(),
      child: MaterialApp(
            title: 'Namer App',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 30, 21, 26)),
            ),
            home: BlocProvider(
          create: (_) => MovieCubit(),
          child: const NavigationPage(),
        )
      ),
    );
  }
}
