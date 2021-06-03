import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_talk/src/app.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();
    // Set your image cache size
    imageCache.maximumSizeBytes = (1024 * 1024); // 100 MB
    return imageCache;
  }
}

Future main() async {
  CustomImageCache();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(App());
}
