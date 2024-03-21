import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'student_viewmodel.dart';

class StudentView extends StackedView<StudentViewModel> {
  const StudentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StudentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Management')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: viewModel.students.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(viewModel.students[index].id
                                        .toString()),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(viewModel.students[index].firstName),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(viewModel.students[index].lastName),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              // Add your logic for viewing here
                                            },
                                            icon: const Icon(Icons
                                                .visibility), // Icon for view
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // Add your logic for editing here
                                            },
                                            icon: const Icon(
                                                Icons.edit), // Icon for edit
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // Add your logic for deleting here
                                            },
                                            icon: const Icon(Icons
                                                .delete), // Icon for delete
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalForm(context);
        },
        child: const Icon(Icons.add), // Icon for add
      ),
    );
  }

  void _showModalForm(BuildContext context) {
    String selectedGender = 'Male'; // Default gender selection

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text('Add Student'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    const ListTile(
                      title: Text('Gender'),
                    ),
                    ListTile(
                      title: const Text('Male'),
                      leading: Radio(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Female'),
                      leading: Radio(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for saving the form data
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  StudentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentViewModel();
}
