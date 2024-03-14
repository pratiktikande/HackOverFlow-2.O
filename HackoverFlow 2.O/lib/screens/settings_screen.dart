import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:lawtrix/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: NavDrawer(),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Use System Theme"),
            subtitle: const Text('The theme is according to system setting....'),
            trailing: Switch(
                onChanged: (bool? value) {
                  provider.toggleFollowSystem();
                },
                value: provider.followsystem),
          ),
          Visibility(
            visible: provider.followsystem,
              child: const Divider(height: 0)
          ),
          Visibility(
            visible: !provider.followsystem,
            child: ListTile(
              leading: provider.darkmodeon ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
              title: const Text("Dark Mode"),
              subtitle: const Text('Toggle between dark mode on and off....'),
              trailing: Switch(
                  onChanged: (bool? value) {
                    provider.toggleTheme();
                  },
                  value: provider.darkmodeon),
            ),
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text('Accounts'),
            subtitle: const Text('Change account details....'),
            onTap: () {
              Navigator.pushNamed(context, route.accountSettingsPage);
            },
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('About us'),
            subtitle: Text('View information about creator....'),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Contact us'),
            subtitle: Text('Want to give feedback ....'),
          ),
          const Divider(height: 0)
        ],
      ),
    );
  }
}
