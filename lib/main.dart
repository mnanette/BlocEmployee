 

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/employee_bloc.dart';
 
 
 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/pages/home5.dart';

import 'package:flutter_application_1/repository/employee_repository.dart';
void main() {
 

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<EmployeeBloc>(
        create: (context) => EmployeeBloc(EmployeeRepository()),
      ) 
    ],
    child: const MyApp(),
  ));
}

 
 

  // Sort the strings lexicographically
 

  // Compare the first and last strings
 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      
      
    );
  }
}
 
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Home Page'),
            ),
            body: Center(
        child: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoadingState) {
              return const Text('Loading...');
            }
            if(state is EmployeeLoadedState) {
              return ListView.builder(
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.employees[index].name as String),
                    subtitle: Text(state.employees[index].email ?? ''),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
          );
        }
      
