
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/employee_bloc.dart';
 
  
import 'package:flutter_bloc/flutter_bloc.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
void initState() {
context.read<EmployeeBloc>().add(LoadEmployeeEvent());
super.initState();
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is EmployeeErrorSate) {
              return Center(
                child: Text(state.error),
              );
            }
            if(state is EmployeeLoadedState) {
              return ListView.builder(
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.employees[index].name?.first ?? 'no name'),
                    subtitle: Text(state.employees[index].email ?? 'no email'),
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
}