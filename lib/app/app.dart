import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/home/home.dart';
import 'package:pancong/features/pos/pos.dart';
import 'package:pancong/features/product/product.dart';
import 'package:pancong/features/settings/settings.dart';
import 'package:pancong/features/transaction/transaction.dart';

import 'routes.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(
          create: (context) => ProfileBloc()..add(GetProfileEvent()),
        ),
        BlocProvider(
          create: (context) => XenditBloc()..add(GetXenditEvent()),
        ),
        BlocProvider(
          create: (context) => StruckBloc()..add(GetStruckEvent()),
        ),
        BlocProvider(create: (context) => PrinterBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => FormProductBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => TransactionBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        title: 'Pancong',
        debugShowCheckedModeBanner: false,
        theme: LightTheme(AppColors.orange).theme,
        home: const SplashPage(),
        onGenerateRoute: routes,
      ),
    );
  }
}
