abstract class BasePresenter {
  void initState();

  void didChangeDependencies();

  void didUpdateWidgets<W>(W oldWidget);

  void deactivate();

  void dispose();
}
