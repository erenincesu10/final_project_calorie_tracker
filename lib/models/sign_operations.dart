// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignOperations {
  String email;
  String password;
  bool returnToken;
  SignOperations({
    required this.email,
    required this.password,
    required this.returnToken,
  });

  SignOperations copyWith({
    String? email,
    String? password,
    bool? returnToken,
  }) {
    return SignOperations(
      email: email ?? this.email,
      password: password ?? this.password,
      returnToken: returnToken ?? this.returnToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'returnToken': returnToken,
    };
  }

  factory SignOperations.fromMap(Map<String, dynamic> map) {
    return SignOperations(
      email: map['email'] as String,
      password: map['password'] as String,
      returnToken: map['returnToken'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignOperations.fromJson(String source) =>
      SignOperations.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SignOperations(email: $email, password: $password, returnToken: $returnToken)';

  @override
  bool operator ==(covariant SignOperations other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.returnToken == returnToken;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ returnToken.hashCode;
}
