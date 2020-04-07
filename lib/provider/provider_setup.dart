import 'package:flutteramazingiamges/ui/pages/index.dart';
import 'package:provider/provider.dart';

import 'index.dart';

class ProviderSetup {
  static ProviderSetup _instance;

  static ProviderSetup instance() {
    if (_instance == null) {
      _instance = ProviderSetup._internal();
    }
    return _instance;
  }

  ProviderSetup._internal();

  ChangeNotifierProvider<CounterProvider> secondPage() {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: SecondPage(),
    );
  }

  ChangeNotifierProvider<HomeProvider> homePage() {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomePage(),
    );
  }
}
