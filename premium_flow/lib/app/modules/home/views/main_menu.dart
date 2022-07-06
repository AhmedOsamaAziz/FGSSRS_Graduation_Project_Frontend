part of home;

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController ctr = Get.find();
    return MainMenuItems(
      menuItems: [
        MainMenuButtonData(
          activeIcon: Icons.person,
          icon: Icons.person_outline,
          label: 'Students',
          totalNotif: 45,
          onPressed: () {
            ctr.changeCurrentPage('/student');
            ctr.title.value = 'Students';
          },
        ),
        MainMenuButtonData(
          activeIcon: Icons.badge,
          icon: Icons.badge_outlined,
          label: 'Employees',
          totalNotif: 100,
          onPressed: () {
            ctr.changeCurrentPage('/employee');
            ctr.title.value = 'Employees';
          },
        ),
        MainMenuButtonData(
            activeIcon: Icons.account_tree,
            icon: Icons.account_tree_outlined,
            label: 'Flow',
            onPressed: () {
              ctr.changeCurrentPage('/flow');
              ctr.title.value = 'Flow';
            }),
        MainMenuButtonData(
            activeIcon: Icons.paste_rounded,
            icon: Icons.paste_rounded,
            label: 'Documents',
            onPressed: () {
              ctr.changeCurrentPage('/postpone-course');
              ctr.title.value = "Course Potpone";
            }),
      ],
    );
  }
}
