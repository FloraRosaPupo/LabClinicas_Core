import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fe_lab_clinicas_core/src/loader/labclinasLoader.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.binding,
    this.pages,
    this.pagesBuilder,
    this.modules,
    required this.title,
  });

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilder;
  final List<FlutterGetItModule>? modules;
  final String title; //obrigatorio

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: kDebugMode,
        bindings: binding,
        pages: [...pages ?? [], ...pagesBuilder ?? []],
        modules: modules,
        builder: (context, routes, flutterGetItNavObserver) {
          return AsyncStateBuilder(
            loader: LabClinicasLoader(),
            builder: (navigatorObserver) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: LabClinicasTheme.lightTheme,
                darkTheme: LabClinicasTheme.darkTheme,
                navigatorObservers: [
                  navigatorObserver,
                  flutterGetItNavObserver
                ], //observar os modulos
                routes: routes,
                title: title,
              );
            },
          );
        });
  }
}
