import 'package:schoolmanagement/app/app.bottomsheets.dart';
import 'package:schoolmanagement/app/app.dialogs.dart';
import 'package:schoolmanagement/app/app.locator.dart';
import 'package:schoolmanagement/app/app.router.dart';
import 'package:schoolmanagement/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatestudentView() async {
    await _navigationService.navigateToStudentView();
  }
}
