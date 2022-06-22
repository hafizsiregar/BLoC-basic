import 'dart:async';
 
 // class enum ini mendifinsikan kemungkinan 2 event yang akan terjadi
enum CounterEvent { Increment, Decrement }
 
class CounterBloc {
  // nilai state awalnya 0
  int counter = 0;
 
  // StreamController untuk mengelola stream event
  final StreamController<CounterEvent> _eventController = StreamController<CounterEvent>();
  //StreamSink untuk event controller, sink digunakan sebagai input ke dalam sebuah stream. 
  //Sink ini nanti akan diakses dari UI.
  StreamSink get eventSink => _eventController.sink;
 
  // StreamController untuk mengelola stream nilai counter
  final StreamController<int> _counterController = StreamController<int>();
  // StreamSink untuk state nilai counter.
  // Sink di sini akan menerima input dari event lalu nilai stream-nya akan digunakan di UI.
  StreamSink<int> get _counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;
 
  CounterBloc() {
    // listen berfungsi mendengarkan setiap ada event baru yang masuk ke dalam stream
    _eventController.stream.listen(_mapEventToState);
  }
 
  void _mapEventToState(CounterEvent event) {
    // logika untuk mengubah state dari event yang masuk
    if (event == CounterEvent.Increment) {
      counter++;
    } else {
      counter--;
    }
 
    _counterSink.add(counter);
  }
 
  // method agar tidak terjadi memory leak
  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}