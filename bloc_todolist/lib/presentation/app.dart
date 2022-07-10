import 'package:bloc_todolist/shared/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/todo_model.dart';
import '../shared/service/navigation_service.dart';
import 'bloc/edit bloc/edit_bloc.dart';
import 'bloc/todo bloc/todo_bloc.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodosEvent(todoList: todoListDemo),
            ),
        ),
        BlocProvider<EditBloc>(create: (context) => EditBloc()),
      ],
      child: MaterialApp(
        title: 'To do List',
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: const Locale("en"),
        theme: ThemeData(
          textTheme: CustomTextStyle.textFontApp,
        ),
        home: HomePage(),
        // translationsKeys: AppTranslation.translations,
      ),
    );
  }
}
