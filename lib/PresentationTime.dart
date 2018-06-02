import 'dart:math';


class PresentationTime {
  double startHour;
  double endHour;
  Day day;
  static Random r = new Random(DateTime.now().millisecondsSinceEpoch);

  String StartTime() => "${startHour.toInt()}:00";
  String EndTime() => "${endHour.toInt()}:00";

  PresentationTime.Random()
  {
    startHour = _randomTime();
    endHour = _nextHour(startHour);
    day = _randomDay();
  }

  double _randomTime() {
    return (r.nextInt(12) + 1).toDouble();
  }
  
  double _nextHour(double time) => (time.toInt() % 12.0).toDouble() + 1.0;

  Day _randomDay() {
    return Day.values[r.nextInt(5)];
  }

  String DayToString() {
    switch(day) {
      case Day.Monday:
        return "Monday";
      case Day.Tuesday:
        return "Tuesday";
      case Day.Wednesday:
        return "Wednesday";
      case Day.Thursday:
        return "Thursday";
      case Day.Friday:
        return "Friday";
    }
  }

  int CompareTo(PresentationTime other) {
    if (day == other.day) {
      if (startHour == other.startHour)
         return 0;

      return startHour < other.startHour ? -1 : 1;
    }

    return day.index < other.day.index ? -1 : 1;
  }
}

enum Day { Monday, Tuesday, Wednesday, Thursday, Friday }
