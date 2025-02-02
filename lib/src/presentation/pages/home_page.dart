import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'dashboard/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _navigatorKey = GlobalKey<NavigatorState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  Widget get _drawer {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        setState(() {
          screenIndex = index;
        });
      },
      selectedIndex: screenIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Start',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          label: Text('Dashboard'),
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
        ),
        const NavigationDrawerDestination(
          label: Text('Profile'),
          icon: Icon(Icons.person_pin_outlined),
          selectedIcon: Icon(Icons.person_pin_rounded),
        ),
        const NavigationDrawerDestination(
          label: Text('Grades'),
          icon: Icon(Icons.star_outline),
          selectedIcon: Icon(Icons.star),
        ),
        const NavigationDrawerDestination(
          label: Text('Calendar'),
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
        ),
        const NavigationDrawerDestination(
          label: Text('Private files'),
          icon: Icon(Icons.folder_outlined),
          selectedIcon: Icon(Icons.folder),
        ),
        const NavigationDrawerDestination(
          label: Text('Reports'),
          icon: Icon(Icons.feed_outlined),
          selectedIcon: Icon(Icons.feed),
        ),
        const NavigationDrawerDestination(
          label: Text('Preferences'),
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
        ),
        const NavigationDrawerDestination(
          label: Text('Logout'),
          icon: Icon(Icons.logout_outlined),
          selectedIcon: Icon(Icons.logout),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 4, 28, 4),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 0),
          child: Text(
            'Options',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          label: Text('Reports & Analytics'),
          icon: Icon(Icons.task_outlined),
          selectedIcon: Icon(Icons.task),
        ),
        const NavigationDrawerDestination(
          label: Text('Mata Kuliah'),
          icon: Icon(Icons.book_outlined),
          selectedIcon: Icon(Icons.book),
        ),
        const NavigationDrawerDestination(
          label: Text('Portal'),
          icon: Icon(Icons.school_outlined),
          selectedIcon: Icon(Icons.school),
        ),
        const NavigationDrawerDestination(
          label: Text('Panduan E-Learning'),
          icon: Icon(Icons.help_center_outlined),
          selectedIcon: Icon(Icons.help_center),
        ),
      ],
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'KULON - HATSUBOSHI GAKUEN',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          ButtonIconWidget(
            size: WidgetStandardSize.s,
            color: Colors.blue,
            icon: Icons.dark_mode_outlined,
          ),
          SizedBox(width: 10),
          ButtonIconWidget(
            size: WidgetStandardSize.s,
            color: Colors.blue,
            icon: Icons.notifications_outlined,
          ),
          SizedBox(width: 10),
          ButtonIconWidget(
            size: WidgetStandardSize.s,
            color: Colors.blue,
            icon: Icons.chat_outlined,
          ),
          SizedBox(width: 10),
          ButtonIconWidget(
            size: WidgetStandardSize.s,
            color: Colors.blue,
            icon: Icons.settings,
          ),
          SizedBox(width: 10),
          ButtonIconWidget(icon: Icons.person),
          SizedBox(width: 16),
        ],
      ),
      drawer: showNavigationDrawer ? null : _drawer,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: [
            if (showNavigationDrawer) _drawer,
            Expanded(
              child: Scaffold(
                body: Navigator(
                  key: _navigatorKey,
                  initialRoute: '/',
                  onGenerateRoute: _onGenerateRoute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route<Widget> _onGenerateRoute(RouteSettings settings) {
    final page = switch (settings.name) {
      '/' => const DashboardPage(),
      _ => throw StateError('Unexpected route name: ${settings.name}!')
    };

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer ? buildDrawerScaffold(context) : buildDrawerScaffold(context);
  }
}
