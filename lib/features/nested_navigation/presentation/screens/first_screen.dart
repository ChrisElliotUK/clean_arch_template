import 'package:clean_arch_template/features/nested_navigation/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static const String id = '/first_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SecondScreen.id);
          },
          child: const Text('Go to Screen Two'),
        ),
      ),
    );
  }
}
