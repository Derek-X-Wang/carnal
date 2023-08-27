import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/app/app.dart';
import 'package:carnal/utils/tree/tree.dart';
import 'package:profiles_repository/profiles_repository.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    final authenticationRepository =
        RepositoryProvider.of<AuthenticationRepository>(context);
    final user = authenticationRepository.currentUser;
    final profilesRepository =
        RepositoryProvider.of<ProfilesRepository>(context);
    return Material(
      child: BlocProvider(
        create: (context) => SettingsBloc(
          authenticationRepository: authenticationRepository,
          profilesRepository: profilesRepository,
          settings: profilesRepository.currentSettings(user.id),
        ),
        child: SettingsView(),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    final bloc = BlocProvider.of<SettingsBloc>(context);
    final scaffoldManager = ScaffoldMessenger.of(context);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  child: Text('Menu'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Eye'),
                  onTap: () {
                    // Settingsle navigation or any action related to the Settings
                    context.go('/eye');
                  },
                ),
                ListTile(
                  title: Text('Mouth'),
                  onTap: () {
                    // Settingsle navigation or any action related to the Settings
                    context.go('/mouth');
                  },
                ),
                ListTile(
                  title: Text('Hand'),
                  onTap: () {
                    // Settingsle navigation or any action related to the hand
                    context.go('/hand');
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    // Settingsle navigation to the settings page
                    context.go('/settings');
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: bloc.apiKeyController,
                  decoration: InputDecoration(
                    labelText: 'API Key',
                    hintText: 'Enter your API key here',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: bloc.ignoreFilesController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Ignore Files',
                    hintText:
                        'Enter the files that should be ignored, one per line',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Save settings here
                    final apiKey = bloc.apiKeyController.text;
                    final ignoreFiles = bloc.ignoreFilesController.text;
                    print('API Key: $apiKey');
                    print('Ignore Files: $ignoreFiles');
                    bloc.add(SettingsSaveRequested());
                    scaffoldManager.showSnackBar(SnackBar(
                      content: Text("Successfully saved"),
                    ));
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addWatcherPath(
      AppBloc bloc, ScaffoldMessengerState scaffoldManager, String? path) {
    if (path == null) {
      return;
    }
    bloc.add(WatcherItemAdded(WatcherItem(path)));
    scaffoldManager.showSnackBar(SnackBar(
      content: Text("Successfully added $path"),
    ));
  }

  Future<String?> _showTextInputDialog(BuildContext context) async {
    String inputValue = '';

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter path or URL'),
          content: TextField(
            onChanged: (value) {
              inputValue = value;
            },
            decoration: InputDecoration(hintText: 'Please enter path'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(inputValue);
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
