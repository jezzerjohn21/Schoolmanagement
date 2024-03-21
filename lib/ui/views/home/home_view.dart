import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:schoolmanagement/themes/app_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:schoolmanagement/ui/common/app_colors.dart';
import 'package:schoolmanagement/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class MenuData {
  final IconData icon;
  final String title;

  MenuData(this.icon, this.title);
}

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Management')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: [
                      _buildMenuItem(context, 'Students', Icons.people, () {

                        viewModel.navigatestudentView();
                        // Navigate to students screen
                        // Example: Navigator.pushNamed(context, '/students');
                      }),
                      _buildMenuItem(context, 'Teachers', Icons.person, () {
                        // Navigate to teachers screen
                        // Example: Navigator.pushNamed(context, '/teachers');
                      }),
                      _buildMenuItem(context, 'Subjects', Icons.book, () {
                        // Navigate to subjects screen
                        // Example: Navigator.pushNamed(context, '/subjects');
                      }),
                      _buildMenuItem(context, 'Classes', Icons.school, () {
                        // Navigate to classes screen
                        // Example: Navigator.pushNamed(context, '/classes');
                      }),
                      _buildMenuItem(context, 'Classrooms', Icons.class_, () {
                        // Navigate to classrooms screen
                        // Example: Navigator.pushNamed(context, '/classrooms');
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48.0,
                color: Colors.blue,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
