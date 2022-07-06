part of employee;

// class StudentCardInfo {
//   final Student student;
//   final Function() onPressed;

//   StudentCardInfo(
//     this.student,
//     this.onPressed,
//   );
// }

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employee,
    required this.onPressed,
  });

  final Employee employee;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      hoverColor: KlightPallet.primaryColor.withOpacity(.3),
      color: KlightPallet.secondBackgroundColor,
      height: 100,
      width: 300,
      radius: 25,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildImage(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildName(),
                    _buildEmail(),
                    // _buildStydyType(),
                    // _buildSpecialize(),
                    // _buildNoOfOpenApp()
                  ],
                ),
              ),
            ),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage("assets/images/AvatarMaker (1).png"),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _buildName() {
    return MyText(
      text: employee.empName ?? 'N/A',
      color: KlightPallet.primaryColor,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildEmail() {
    return MyText(
      text: employee.email.toString(),
      color: KlightPallet.informationColor,
      textAlign: TextAlign.start,
    );
  }

  // Widget _buildNoOfOpenApp() {
  //   return const NotificationCount(
  //     count: 0,
  //   );
  // }

  Widget _buildButton() {
    return const MyContainer(
      height: 80,
      width: 30,
      // color: KlightPallet.primaryColor,
      child: Center(
        child: Icon(
          Icons.more_vert,
          color: KlightPallet.primaryColor,
        ),
      ),
    );
  }
}
