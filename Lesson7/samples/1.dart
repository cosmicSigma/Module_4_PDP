import "dart:io";
void main() {
  final pathLocal = "/home/linux/IdeaProjects/Module_4_PDP/Lesson7/samples";
  Directory newDir = Directory("$pathLocal/photos");
  newDir.create(recursive: true);

  // newDir.rename("photos");

  print(newDir.parent.list());

  // newDir.delete();
}

// 1525044563:e1pacOTNm6u_oqqUXW-WTQ
// rtmps://dc4-1.rtmp.t.me/s/