

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
    //final plans = context.select((MainCubit cubit) => cubit.);
    return Column(children: [
      ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('Королёв');Navigator.pop(context);}, child: Text('Королев')),
      ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('сергиев посад');Navigator.pop(context);}, child: Text('Дача')),
      ElevatedButton(onPressed: (){ context.read<MainCubit>().changeCity('Москва');Navigator.pop(context);}, child: Text('Москва'))
    ],);
  }
}
