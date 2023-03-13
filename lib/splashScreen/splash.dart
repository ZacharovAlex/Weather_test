

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../errors/app_error.dart';
import '../errors/network_connection_error.dart';
import '../main_cubit.dart';

class splashScreen extends StatelessWidget {

   splashScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error = context.select((MainCubit cubit) => cubit.state.error);
     late Widget textError;
    if (error is NetworkConnectionError){
      textError =Text('${error.message}');
    } else
      if(error!=null) textError = Text('что-то пошло не так'); else textError = Text('');

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text('ПОГОДА ЕПТА'),
        SizedBox(height: 20,),
        Container(
            height:250,
            child: RiveAnimation.asset('assets/rive/cloud-and-sun.riv')),
          textError,
      ],),
    );
  }
}
