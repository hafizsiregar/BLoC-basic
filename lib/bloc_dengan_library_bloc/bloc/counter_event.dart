part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

// class increment dan decrement sebagai event yang akan dijalankan oleh bloc
class Increment extends CounterEvent {}
 
class Decrement extends CounterEvent {}