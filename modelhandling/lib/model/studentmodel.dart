class Student {
  final String id;
  final String name;
  final int age;
  final double gpa;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.gpa,
  });

  double get average => gpa;

  String get status => gpa >= 2.0 ? 'Passed' : 'Failed';

  //Raw data to json
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      age: map['age '] as int,
      gpa: (map['gpa'] as num).toDouble(),
    );
  }

  //json to raw data
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age, 'gpa': gpa};
  }
}
