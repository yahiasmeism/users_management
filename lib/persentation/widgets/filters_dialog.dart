// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/business_logic/cubits/users_cubit.dart';

class FiltersDialog extends StatelessWidget {
  FiltersDialog({super.key});
  int? filterByAge;
  String? filterByGender;
  int? filterByBirthYear;
  // List Of Gender Options
  final genderOptions = [
    const DropdownMenuEntry(value: 'male', label: 'Male'),
    const DropdownMenuEntry(value: 'female', label: 'Female'),
  ];

  // List Of Gender Options
  final ageOptions = List.generate(50, (index) {
    return DropdownMenuEntry(value: index + 15, label: (index + 15).toString());
  });

  // List of Birth Date Options
  final birthYearOptions = List.generate(100, (index) {
    int year = DateTime.now().year - index;
    return DropdownMenuEntry(value: year, label: year.toString());
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.sort),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return filterAlertDialog(context);
          },
        );
      },
    );
  }

  AlertDialog filterAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Search filters"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customDropDownMenu(
            initialSelection: filterByGender,
            title: 'Gender',
            onSelected: (genderOption) {
              filterByGender = genderOption;
            },
            dropdownMenuEntries: genderOptions,
          ),
          customDropDownMenu(
            initialSelection: filterByAge,
            title: 'Age',
            onSelected: (ageOption) {
              filterByAge = ageOption;
            },
            dropdownMenuEntries: ageOptions,
          ),
          customDropDownMenu(
            initialSelection: filterByBirthYear,
            title: 'Birth year',
            onSelected: (birthYearOption) {
              filterByBirthYear = birthYearOption;
            },
            dropdownMenuEntries: birthYearOptions,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<UsersCubit>(context).filter(
              age: filterByAge,
              birthYear: filterByBirthYear,
              gender: filterByGender,
            );
          },
          child: const Text('ok'),
        ),
      ],
    );
  }

  // Custom Manu Options
  customDropDownMenu<T>({
    required String title,
    required void Function(dynamic value)? onSelected,
    required T initialSelection,
    required List<DropdownMenuEntry> dropdownMenuEntries,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        DropdownMenu(
          textStyle: const TextStyle(fontSize: 18),
          initialSelection: initialSelection,
          inputDecorationTheme:
              const InputDecorationTheme(border: InputBorder.none),
          onSelected: onSelected,
          dropdownMenuEntries: [
            const DropdownMenuEntry(value: null, label: 'All'),
            ...dropdownMenuEntries
          ],
        ),
      ],
    );
  }
}
