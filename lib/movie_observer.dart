import 'package:bloc/bloc.dart';

class MovieObserver extends BlocObserver {
    const MovieObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    
  }
}
