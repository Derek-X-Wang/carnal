import 'package:carnal/eye/eye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carnal/app/app.dart';

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
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Mouth'),
                  onTap: () {
                    // Handle navigation or any action related to the mouth
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Hand'),
                  onTap: () {
                    // Handle navigation or any action related to the hand
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    // Handle navigation to the settings page
                    Navigator.pop(context);
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
                    title: Text(item.src),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter file or URL',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  appBloc.add(WatcherItemAdded(WatcherItem(_controller.text)));
                  _controller.clear();
                },
                child: Text('Add Item'),
              )
            ],
          ),
        );
      },
    );
  }
}
