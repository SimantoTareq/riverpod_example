class UserModel {
  List<String> lines;

  UserModel({
    required this.lines,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      lines: List<String>.from(json['lines']), 
    );
  }
}
