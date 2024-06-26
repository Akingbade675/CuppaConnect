import 'package:cart_repository/cart_repository.dart';
import 'package:coffee_shop_app/app.dart';
import 'package:coffee_shop_app/src/utils/bloc_observer/bloc_observer.dart';
import 'package:favourite_repository/favourite_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = true;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await LocalCartRepository.init();
  await LocalFavouriteRepository.init();
  runApp(const MyApp());
}
