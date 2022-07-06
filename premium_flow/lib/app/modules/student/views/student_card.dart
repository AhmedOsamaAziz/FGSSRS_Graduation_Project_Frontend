part of student;

// class StudentCardInfo {
//   final Student student;
//   final Function() onPressed;

//   StudentCardInfo(
//     this.student,
//     this.onPressed,
//   );
// }

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.student,
    required this.onPressed,
  });

  final Student student;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () {},
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
                    _buildCode(),
                    _buildStydyType(),
                    _buildSpecialize(),
                    _buildNoOfOpenApp()
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
        backgroundImage: AssetImage("assets/images/AvatarMaker.png"),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _buildName() {
    return MyText(
      text: student.name ?? 'N/A',
      color: KlightPallet.primaryColor,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildCode() {
    return MyText(
      text: student.studentCode.toString(),
      color: KlightPallet.informationColor,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildStydyType() {
    return MyText(
      text: student.studyType.toString(),
      color: KlightPallet.informationColor,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildSpecialize() {
    return MyText(
      text: student.studySpecialize.toString(),
      color: KlightPallet.informationColor,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildNoOfOpenApp() {
    return const NotificationCount(
      count: 0,
    );
  }

  Widget _buildButton() {
    return MyContainer(
      onTap: () {},
      highlightColor: KlightPallet.secondColor,
      hoverColor: KlightPallet.secondColor,
      color: KlightPallet.secondBackgroundColor,
      height: 80,
      width: 30,
      // color: KlightPallet.primaryColor,
      child: const Center(
        child: Icon(
          Icons.more_vert,
          color: KlightPallet.primaryColor,
        ),
      ),
    );
  }
}
