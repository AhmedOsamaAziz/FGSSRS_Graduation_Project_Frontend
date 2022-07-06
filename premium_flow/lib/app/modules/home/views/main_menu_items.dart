part of home;

class MainMenuItems extends StatelessWidget {
  const MainMenuItems({super.key, required this.menuItems});

  final List<MainMenuButtonData> menuItems;

  @override
  Widget build(BuildContext context) {
    HomeController ctr = Get.find();
    return Obx(
      () => Column(
        children: menuItems.asMap().entries.map((e) {
          final index = e.key;
          final data = e.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MainMenuButton(
              data: data,
              isSelected: ctr.selectedIndex.value == index,
              onPressed: () {
                menuItems[index].onPressed();
                ctr.selectedIndex.value = index;
              },
              isHoverd: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}
