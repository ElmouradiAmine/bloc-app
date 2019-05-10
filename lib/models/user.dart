class User {
  int age;
  String name;
  double height;

  User(this.name,this.age,this.height);

  User.empty(){
    name = '';
    age = 0;
    height = 0.0;
  }
}