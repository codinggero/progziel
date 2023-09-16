import '/package.dart';

extension Times on DateTime {
  get timestamp => millisecondsSinceEpoch;
}

extension Translate on String {
  Map<String, String> get data => {
        'intro_title': 'Intro Title',
        'intro_description': 'Intro Description',
        'get_started': 'Get Started'
      };

  String get translate {
    if (data.containsKey(this)) {
      return data[this]!;
    } else {
      console.log({'translate': this});
      return replaceAll('_', ' ');
    }
  }
}
