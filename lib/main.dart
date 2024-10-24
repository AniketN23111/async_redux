import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:last_step/Constants/locator.dart';
import 'package:last_step/Constants/route_names.dart';
import 'package:last_step/Model/product_response.dart';
import 'package:last_step/Views/DatabaseOperation/database_operation_connector.dart';
import 'package:last_step/Views/SecondPage/second_page_connector.dart';
import 'package:last_step/Views/SingleProduct/single_product_connector.dart';
import 'package:last_step/Views/UploadFile/upload_file_connector.dart';
import 'package:last_step/app_state.dart';

import 'Views/Home/my_home_page_connector.dart';

late Store<AppState> store;
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await setupServiceLocator();
  NavigateAction.setNavigatorKey(navigatorKey);
  var state = AppState.initState();
  store = Store<AppState>(initialState: state);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        initialRoute: RoutesNames.myHomePage,
        home: const MyHomePageConnector(),
        routes: {
          RoutesNames.myHomePage: (context) => const MyHomePageConnector(),
          RoutesNames.mySecondPage: (context) => const SecondPageConnector(),
          RoutesNames.databaseOperation: (context) =>
              const DataBaseOperationConnector(),
          RoutesNames.uploadFile: (context) => const UploadFileConnector(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RoutesNames.myHomePage:
              return MaterialPageRoute(
                  builder: (context) => const MyHomePageConnector());
            case RoutesNames.mySecondPage:
              return MaterialPageRoute(
                  builder: (context) => const SecondPageConnector());
            case RoutesNames.databaseOperation:
              return MaterialPageRoute(
                  builder: (context) => const DataBaseOperationConnector());
            case RoutesNames.singleProduct:
              return settings.arguments != null
                  ? MaterialPageRoute(
                      builder: (context) => SingleProductConnector(
                          productResponse:
                              settings.arguments as ProductResponse))
                  : MaterialPageRoute(
                      builder: (context) => const SingleProductConnector());
            case RoutesNames.uploadFile:
              return MaterialPageRoute(
                  builder: (context) => const UploadFileConnector());
          }

          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Route not found!'),
              ),
            ),
          );
        },
      ));
}
