part of home;

class UserCardData {
  final ImageProvider? image;
  final String? name;
  final String? jobDesk;

  UserCardData(this.image, this.name, this.jobDesk);
}

class UserCard extends StatelessWidget {
  final UserCardData userCardData;
  final VoidCallback onPressed;

  const UserCard(
      {super.key, required this.userCardData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildAvatar(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                _buildJobDescription(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 25,
      backgroundImage: userCardData.image,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildName() {
    return const MyText(
      color: KlightPallet.primaryColor,
      text: "Ahmed Osama",
      fontSize: 14,
      // fontWeight: FontWeight.bold,
    );
  }

  Widget _buildJobDescription() {
    return const MyText(
      color: KlightPallet.informationColor,
      text: "Software Developer",
      fontSize: 11,
    );
  }
}
