import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(home:
    ChangeNotifierProvider(
      create: (context) => FormStateModel(), // Инициализация состояния
      child:DynamicFormScreen()),
    ),
  );
}


class FormStateModel with ChangeNotifier {
  Widget _currentForm = CategoryAForm();
  bool set = false;

  Widget get currentForm => _currentForm;

  void switchForm(Widget newForm) {
    set = true;
    _currentForm = newForm;
    notifyListeners();
  }
}

class DynamicFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateModel>(context); // Получаем текущее состояние

    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Form")),
      body: formState.currentForm, // Отображаем текущую форму
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "A"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "B"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "C"),
        ],
        onTap: (index) {
          if (index == 0) {
            formState.switchForm(CategoryAForm());
          } else if (index == 1) {
            formState.switchForm(CategoryBForm());
          } else if (index == 2) {
            formState.switchForm(CategoryCForm());
          }
        },
      ),
    );
  }
}


class CategoryAForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Форма категории A"));
  }
}

class CategoryBForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Форма категории B"));
  }
}

class CategoryCForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Форма категории C"));
  }
}