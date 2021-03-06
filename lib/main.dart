import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc_dicoding/bloc_dengan_library_cubit/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider<CounterCubit>(
        create: (_) => CounterCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page')),
      
      //! digunakan dengan library Bloc 
      // BlocProvider<CounterBloc>(
      //   create: (_) => CounterBloc(),
      //   child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({
    Key? key, 
    required this.title,
    }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  //! digunakan pada saat tidak dengan library bloc
  // final counterBloc = CounterBloc();

  // @override
  // void dispose() {
  //   counterBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //! digunakan pada saat dengan library cubit
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),

      //! digunakan pada saat dengan library bloc
      // BlocBuilder<CounterBloc, CounterState>(
      //   builder: (context, state) {
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           const Text(
      //             'You have pushed the button this many times:',
      //           ),
      //           Text(
      //             '${state.value}',
      //             style: Theme.of(context).textTheme.headline4,
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),

      //! stream builder digunakan ketika tanpa library bloc
      // StreamBuilder(
      //   stream: counterBloc.counterStream,
      //   builder: (context, snapshot) {
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           const Text(
      //             'You have pushed the button this many times:',
      //           ),
      //           Text(
      //             '${snapshot.data}',
      //             style: Theme.of(context).textTheme.headline4,
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              //! digunakan pada saat dengan library cubit
              context.read<CounterCubit>().decrement();
              //! digunakan pada saat dengan library bloc
              // context.read<CounterBloc>().add(Decrement());
              //! eventSink digunakan ketika tanpa library bloc
              // counterBloc.eventSink.add(CounterEvent.Decrement);
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
               //! digunakan pada saat dengan library cubit
              context.read<CounterCubit>().decrement();
              //! digunakan pada saat dengan library bloc
              // context.read<CounterBloc>().add(Increment());
              //! eventSink digunakan ketika tanpa library bloc
              // counterBloc.eventSink.add(CounterEvent.Increment);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
