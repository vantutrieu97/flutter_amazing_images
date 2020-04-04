import 'package:flutteramazingiamges/mvp/base_page_presenter.dart';
import 'package:flutteramazingiamges/ui/pages/index.dart';

class SecondPagePresenter extends BasePagePresenter<SecondPageState> {
  void incrementCounter() {
    view.setCounter();
  }
}
