import 'notification_mixin.dart';

class Tasbeeh with NotificationMixin {

  // Private Properties
  String _dhikrName;
  int _counter = 0;
  int _target;


  // Default Constructor
  Tasbeeh({
    required String name,
    int target = 33,
  })  : _dhikrName = name,
        _target = target;


  // Named Constructors
  Tasbeeh.subhanAllah()
      : _dhikrName = "SubhanAllah",
        _counter = 0,
        _target = 33;

  Tasbeeh.alhamdulillah()
      : _dhikrName = "Alhamdulillah",
        _counter = 0,
        _target = 33;

  Tasbeeh.allahAkbar()
      : _dhikrName = "Allahu Akbar",
        _counter = 0,
        _target = 34;


  // Getters
  String get dhikrName => _dhikrName;

  int get counter => _counter;

  int get target => _target;

  bool get isCompleted => _counter == _target;


  // Increment Method
  void increment() {
    if (_counter < _target) {
      _counter = _counter + 1;

      if (_counter == _target) {
        print("Target Reached for $_dhikrName!");
        triggerVibration();
      }
    }
  }


  // Reset Method
  void reset() {
    _counter = 0;
  }
}