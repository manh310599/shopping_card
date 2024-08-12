import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/core/application_cubit/application_state.dart';
import 'package:shoppingcart/core/utils/app_theme.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState(themeData: AppTheme.orangeTheme));


}
