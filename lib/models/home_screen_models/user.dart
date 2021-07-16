class User {
  int? userID;
  String? usernmae;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? token;

  User(
      {this.userID,
      this.email,
      this.firstname,
      this.lastname,
      this.password,
      this.usernmae,
      this.token});

  Map<String, dynamic> toDbForRegister() {
    return {
      "username": this.usernmae,
      "first_name": this.firstname,
      "last_name": this.lastname,
      "email": this.email,
      "password": this.password
    };
  }

  Map<String, dynamic> toDbForLogin() {
    return {"email": email, "password": password};
  }

  factory User.fromDbtoModel(Map data) {
    return User(
      email: data['name'],
      token: data['icon'],
    );
  }
}
