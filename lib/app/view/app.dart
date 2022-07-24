import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../post_screen/post_screen.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:BlocProvider(
        create: (_) => PostBloc()..add(PostFetched()),
    child: const PostScreen(),
    ));
  }
}


