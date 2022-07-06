part of student;

class StudentCardItems extends StatelessWidget {
  const StudentCardItems(
      {super.key, required this.onPressed, required this.students});

  // final List<Student> students;
  final VoidCallback onPressed;
  final List<Student> students;
  @override
  Widget build(BuildContext context) {
    StudentController ctr = Get.find();
    return Obx(
      () => SingleChildScrollView(
        child: Wrap(
          // alignment: WrapAlignment.start,
          // crossAxisAlignment: WrapCrossAlignment.start,
          // runAlignment: WrapAlignment.start,
          spacing: kSpacing, // Horizontal
          runSpacing: kSpacing, // Vertical
          // textDirection: TextDirection.ltr,
          // verticalDirection: VerticalDirection.down,
          children: students.asMap().entries.map((e) {
            final index = e.key;
            final data = e.value;
            return StudentCard(
              student: data,
              onPressed: onPressed,
            );
          }).toList(),
        ),
      ),
    );
  }
}
