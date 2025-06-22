import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/route_name.dart';
import 'package:todo/core/utils/app_strings.dart';
import 'package:todo/core/widgets/custom_text_form_field.dart';
import 'package:todo/core/widgets/rounded_elevated_button.dart';
import 'package:todo/features/todo/view/bloc/todo_cubit.dart';

import '../../../core/theme/app_color.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final _validateKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(
          "Todos",
          style: TextStyle(
            color: AppColor.snackBarBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Form(
                key: _validateKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: titleController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppString.required;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: AppString.title,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: descriptionController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppString.required;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: AppString.description,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              RoundedElevatedButton(
                buttonText: "Add Todo",
                onPress: () {
                  if (_validateKey.currentState!.validate()) {
                    context.read<TodoCubit>().addTodo({
                      "title": titleController.text.toString(),
                      "description": descriptionController.text.toString(),
                    });
                    context.goNamed(RouteName.home);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
