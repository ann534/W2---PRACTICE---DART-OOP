class MyDuration {
  // Private immutable field (milliseconds)
  final int _milliseconds;

  // Private constructor (used internally)
  const MyDuration._(this._milliseconds)
      : assert(_milliseconds >= 0, 'Duration cannot be negative');

  // Named constructors
  factory MyDuration.fromHours(int hours) {
    if (hours < 0) throw Exception('Duration must be >= 0');
    return MyDuration._(hours * 60 * 60 * 1000);
  }

  factory MyDuration.fromMinutes(int minutes) {
    if (minutes < 0) throw Exception('Duration must be >= 0');
    return MyDuration._(minutes * 60 * 1000);
  }

  factory MyDuration.fromSeconds(int seconds) {
    if (seconds < 0) throw Exception('Duration must be >= 0');
    return MyDuration._(seconds * 1000);
  }

  // Getter for total milliseconds
  int get inMilliseconds => _milliseconds;

  // Overloaded > operator
  bool operator >(MyDuration other) => _milliseconds > other._milliseconds;

  // Overloaded + operator
  MyDuration operator +(MyDuration other) {
    return MyDuration._(_milliseconds + other._milliseconds);
  }

  // Overloaded - operator
  MyDuration operator -(MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) throw Exception('Resulting duration cannot be negative!');
    return MyDuration._(result);
  }

  // Display in readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

// ---------------------- MAIN ----------------------
void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes

  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); // Output: Resulting duration cannot be negative!
  }
}
