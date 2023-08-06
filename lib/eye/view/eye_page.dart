import 'package:carnal/eye/eye.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carnal/app/app.dart';

class EyePage extends StatelessWidget {
  const EyePage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: EyePage());

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => EyeBloc(),
      child: const EyeView(),
    );
  }
}

class EyeView extends StatelessWidget {
  const EyeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<EyeBloc>(context);
    return BlocBuilder<EyeBloc, EyeState>(builder: (context, state) {
      return const SafeArea(child: Text("b"));
    });
  }
}
