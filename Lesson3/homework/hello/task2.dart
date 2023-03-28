// import 'dart:io';
//
// void main() async {
//   Directory directory = Directory.current;
//   File user = File(directory.path + '/user.dart');
//   await user.create();
//
//   user.writeAsStringSync("""
// class User {
//   String? firstName;
//   String? sureName;
//   String? email;
//   String? password;
//   User(this.firstName, this.sureName, this.email, this.password);
// }
// User user1 = User("Ali","Aliyev","example@example.com","password");""");
//
//   // print(user.readAsStringSync());
// }

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n-1);
  }
}

Iterable<String> c(int n) sync* {
  switch(n) {
    case 1: yield "bir"; break;
    case 2: yield "ikki"; break;
    case 3: yield "uch"; break;
    case 4: yield "tort"; break;
    case 5: yield "besh"; break;
    case 6: yield "olti"; break;
    case 7: yield "yetti"; break;
    case 8: yield "sakkiz"; break;
    case 9: yield "to'qqiz"; break;
  }
}

Iterable<int> b(int n,int m, int k) sync* {
  int i = 1;
  while(i<n) {
    if (i%m==0) yield m;
    if (i%m==0 && i%k==0) yield i*k;
    i++;
  }
}
void main() {
  print(c(1));
  print(b(15, 5, 3));
}