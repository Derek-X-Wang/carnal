import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carnal/app/app.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/eye/eye.dart';
import 'package:carnal/utils/tree/tree.dart';

class EyePage extends StatelessWidget {
  const EyePage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: EyePage());

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return Material(
      child: BlocProvider(
        create: (context) => EyeBloc(),
        child: EyeView(),
      ),
    );
  }
}

class EyeView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  EyeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    final bloc = BlocProvider.of<EyeBloc>(context);
    final scaffoldManager = ScaffoldMessenger.of(context);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Eye'),
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
                    // Handle navigation or any action related to the eye
                    context.go('/eye');
                  },
                ),
                ListTile(
                  title: Text('Mouth'),
                  onTap: () {
                    // Handle navigation or any action related to the mouth
                    context.go('/mouth');
                  },
                ),
                // ListTile(
                //   title: Text('Hand'),
                //   onTap: () {
                //     // Handle navigation or any action related to the hand
                //     context.go('/hand');
                //   },
                // ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    // Handle navigation to the settings page
                    context.go('/settings');
                  },
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Wrap(
                      children: [
                        Checkbox(
                          value: item.canRead,
                          onChanged: (newValue) {
                            item.canRead = newValue!;
                          },
                        ),
                        const Text('Read'),
                        Checkbox(
                          value: item.canWrite,
                          onChanged: (newValue) {
                            item.canWrite = newValue!;
                          },
                        ),
                        const Text('Write'),
                        IconButton(
                          icon: const Icon(Icons.track_changes),
                          onPressed: () async {
                            final tree = await buildTree(item.src, []);
                            printTree(tree, "");
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            appBloc.add(WatcherItemRemoved(item));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            spacing: 3,
            childPadding: const EdgeInsets.all(5),
            children: [
              SpeedDialChild(
                child: const Icon(Icons.input),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: 'Enter path',
                onTap: () async {
                  String? path = await _showTextInputDialog(context);
                  _addWatcherPath(appBloc, scaffoldManager, path);
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.file_open),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                label: 'Select file',
                onTap: () async {
                  final file = await openFile();
                  _addWatcherPath(appBloc, scaffoldManager, file?.path);
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.file_copy),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                label: 'Select files',
                visible: true,
                onTap: () async {
                  final files = await openFiles();
                  for (final file in files) {
                    _addWatcherPath(appBloc, scaffoldManager, file.path);
                  }
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.folder_open),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                label: 'Select folder',
                visible: true,
                onTap: () async {
                  final String? path = await getDirectoryPath();
                  _addWatcherPath(appBloc, scaffoldManager, path);
                },
              ),
            ],
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
