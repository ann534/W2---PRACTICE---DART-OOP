enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return '$street, $city, $zipCode';
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _skills = [Skill.FLUTTER, Skill.DART],
      _address = address,
      _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double totalSalary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;
        case Skill.DART:
          totalSalary += 3000;
          break;
        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }

    return totalSalary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$${_baseSalary}');
    print('Years of Experience: $_yearsOfExperience');
    print('Address: $_address');
    print('Skills: ${_skills.map((s) => s.name).join(', ')}');
    print('Computed Salary: \$${computeSalary()}');
    print('-----------------------------------');
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.OTHER],
    Address(street: '123 Main St', city: 'Nairobi', zipCode: '00100'),
    3,
  );
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    'Ronan',
    45000,
    Address(street: '456 Elm St', city: 'Lagos', zipCode: '20001'),
    5,
  );
  emp2.printDetails();
}
