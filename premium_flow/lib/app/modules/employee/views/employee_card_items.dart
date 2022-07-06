part of employee;

class EmployeeCardItems extends StatelessWidget {
  const EmployeeCardItems({super.key, required this.onPressed});

  // final List<Student> students;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    EmployeeController ctr = Get.find();
    return Obx(
      () => SingleChildScrollView(
        child: Wrap(
          spacing: kSpacing, // Horizontal
          runSpacing: kSpacing, // Vertical
          children: ctr.employees.asMap().entries.map((e) {
            final index = e.key;
            final data = e.value;
            return EmployeeCard(
              employee: data,
              onPressed: onPressed,
            );
          }).toList(),
        ),
      ),
    );
  }
}
