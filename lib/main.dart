import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_managment/resource/providers/hotel_providers.dart';
import 'package:hotel_managment/style/themes/dark_theme.dart';
import 'package:hotel_managment/style/themes/light_theme.dart';
import 'package:hotel_managment/utils/globals.dart';

import 'bloc/appliciation_cubit/application_cubit.dart';
import 'bloc/hotel_bloc/hotel_bloc.dart';
import 'controller/data_store.dart';
import 'layout/main_layout.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  try {
    await Future.wait([
      ApplicationCubit.init(),
      DataStore.instance.init(),

    ]);
  } finally {
    GetIt.I.allowReassignment = true;
    GetIt.I.registerSingleton<HotelRepository>(HotelRepository());
    // FlutterNativeSplash.remove();

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ApplicationCubit()),
          //HotelBloc
          BlocProvider(create: (context) => HotelBloc()),
        ],
        child:const AppMaterial(),
      ),
    );
  }
}

class AppMaterial extends StatefulWidget {
  const AppMaterial({Key? key}) : super(key: key);

  @override
  _AppMaterialState createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BlocConsumer<ApplicationCubit, ApplicationState>(
      listener: (context, state) {
        if (state is ApplicationRestartState) {
          //todo process restart state
        }

      },
      builder: (context, state){
        return MaterialApp(
          key: BlocProvider.of<ApplicationCubit>(context).key,
          navigatorKey: navigatorKey,
          title: ApplicationCubit.info.appName,
          home: BlocProvider(

            create: (context) => HotelBloc(),
            child: const MainLayout(),
          ),
          themeMode: DataStore.instance.isDarkModeEnabled
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en'),
          ],
        );
      },
    );
  }
}
