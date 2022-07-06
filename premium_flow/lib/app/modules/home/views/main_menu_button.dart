part of home;

class MainMenuButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;
  final Function() onPressed;

  MainMenuButtonData(
      {required this.activeIcon,
      required this.icon,
      required this.label,
      required this.onPressed,
      this.totalNotif});
}

class MainMenuButton extends StatelessWidget {
  const MainMenuButton(
      {Key? key,
      required this.data,
      required this.isSelected,
      required this.onPressed,
      required this.isHoverd})
      : super(key: key);

  final MainMenuButtonData data;
  final bool isSelected;
  final bool isHoverd;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        color: !isSelected
            ? Colors.transparent
            : KlightPallet.primaryColor, //.withOpacity(.1)
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          onTap: onPressed,
          // Important to be radioused when hovering
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                _buildIcon(),
                const SizedBox(
                  width: kSpacing / 2,
                ),
                Expanded(child: _buildLable()),
                Padding(
                  padding: const EdgeInsets.only(right: kSpacing / 2),
                  child: NotificationCount(count: data.totalNotif),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      !isSelected ? data.icon : data.activeIcon,
      size: 20,
      color: !isSelected
          ? KlightPallet.informationColor
          : KlightPallet.primaryColorFont,
    );
  }

  Widget _buildLable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data.label,
        style: TextStyle(
          color: !isSelected
              ? KlightPallet.informationColor
              : KlightPallet.primaryColorFont,
          letterSpacing: .8,
          fontSize: 12,
        ),
      ),
    );
  }
}
