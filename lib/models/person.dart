class Person {
  String email;
  String phone;

  Person(String e, String p) {
    this.email = e;
    this.phone = p;
  }

  void changeEmail(String email){
    this.email = email;
  }

  void changeNumber(String number){
    this.phone = number;
  }
}