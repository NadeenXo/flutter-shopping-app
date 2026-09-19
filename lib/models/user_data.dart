class UserData {
  final String name;
  final int age;
  final String favouriteHobby;

  UserData({
    required this.name,
    required this.age,
    required this.favouriteHobby,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age, 'favouriteHobby': favouriteHobby};
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      favouriteHobby: map['favouriteHobby'] ?? '',
    );
  }
}
