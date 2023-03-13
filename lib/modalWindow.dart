

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injectable.dart';
import 'main_cubit.dart';

class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return  ElevatedButton(
    child: const Text('showModeet'),
    onPressed: () {

      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (_) {
          return
            BlocProvider.value(
              value: BlocProvider.of<MainCubit>(context),
              child:  ButtonsCity()
            );




            ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('Королёв');}, child: Text('Королев'));
        },
      );
    },
  );

  }
}

class ButtonsCity extends StatelessWidget {
  const ButtonsCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('Королёв');Navigator.pop(context);}, child: Text('Королев')),
      ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('сергиев посад');Navigator.pop(context);}, child: Text('Дача')),
     // ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('Москва');Navigator.pop(context);}, child: Text('Москва'))
    ],);
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                print('First text field: $text');
              },
            ),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}