class StudentModel {
  String studentName = '';
  int rollNumber = 0;

  StudentModel({String studentName, int rollNumber});

  static List<Map> studentList = [
    {
      "name": "student2",
      "rollno": 2,
    },
    {
      "name": "student3",
      "rollno": 3,
      
    },
    {
      "name": "student4",
      "rollno": 4,
    },
  ];
}


class Academic {
  String academicScore = '';

  Academic({String academic});
}
