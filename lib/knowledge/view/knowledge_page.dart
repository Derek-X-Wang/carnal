import 'package:carnal/utils/context_source/context_source.dart';
import 'package:carnal/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:carnal/widgets/preference_list/preference_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_selector/file_selector.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carnal/app/app.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/knowledge/knowledge.dart';
import 'package:carnal/utils/tree/tree.dart';
import 'package:path/path.dart' as p;

class KnowledgePage extends StatelessWidget {
  const KnowledgePage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: KnowledgePage());

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return Material(
      child: BlocProvider(
        create: (context) => KnowledgeBloc(),
        child: KnowledgeView(),
      ),
    );
  }
}

class KnowledgeView extends StatelessWidget {
  KnowledgeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<KnowledgeBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.windowResize();
    });
    return BlocBuilder<KnowledgeBloc, KnowledgeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBodyOld(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    final bloc = BlocProvider.of<KnowledgeBloc>(context);
    final scaffoldManager = ScaffoldMessenger.of(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(context),
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
          floatingActionButton: _buildActionButton(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    final contextSources =
        context.select((AppBloc bloc) => bloc.state.contextSources);
    final directories = contextSources.whereType<DirectoryContext>().toList();
    final files = contextSources.whereType<FileContext>().toList();
    return PreferenceList(
      children: [
        if (directories.isNotEmpty)
          PreferenceListSection(
            title: Text('page_knowledge.pref_section_title_directory'.tr()),
            children: directories
                .map((e) => PreferenceListItem(
                      disabled: true,
                      title: Text(e.name),
                      accessoryView: IconButton(
                        icon: const Icon(
                          FluentIcons.delete_20_regular,
                          size: 20,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          appBloc.add(ContextSourceRemoved(e));
                        },
                      ),
                    ))
                .toList(),
          ),
        if (files.isNotEmpty)
          PreferenceListSection(
            title: Text('page_knowledge.pref_section_title_file'.tr()),
            children: files
                .map((e) => PreferenceListItem(
                      disabled: true,
                      title: Text(e.name),
                      accessoryView: IconButton(
                        icon: const Icon(
                          FluentIcons.delete_20_regular,
                          size: 20,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          appBloc.add(ContextSourceRemoved(e));
                        },
                      ),
                    ))
                .toList(),
          ),
      ],
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    return CustomAppBar(
        title: Text('page_knowledge.title'.tr()),
        leading: CustomAppBarCloseButton(
          onPressed: () {
            context.go('/');
          },
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.add),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Select file"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Select files"),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text("Select folder"),
                ),
              ];
            },
            onSelected: (value) async {
              if (value == 0) {
                final file = await openFile();
                final path = file?.path;
                if (path != null) {
                  final name = p.basename(path);
                  final source = ContextSource.file(
                      canRead: true, canWrite: true, path: path, name: name);
                  appBloc.add(ContextSourceAdded(source));
                }
              } else if (value == 1) {
                final files = await openFiles();
                for (final file in files) {
                  final path = file.path;
                  final name = p.basename(path);
                  final source = ContextSource.file(
                      canRead: true, canWrite: true, path: path, name: name);
                  appBloc.add(ContextSourceAdded(source));
                }
              } else if (value == 2) {
                final path = await getDirectoryPath();
                if (path != null) {
                  final name = p.basename(path);
                  final source = ContextSource.directory(
                      canRead: true, canWrite: true, path: path, name: name);
                  appBloc.add(ContextSourceAdded(source));
                }
              }
            },
          ),
        ]);
  }

  Widget _buildActionButton(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    final scaffoldManager = ScaffoldMessenger.of(context);
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      mini: true,
      spacing: 3,
      childPadding: const EdgeInsets.all(5),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.file_open),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          label: 'Select file',
          onTap: () async {
            final file = await openFile();
            final path = file?.path;
            if (path != null) {
              final name = p.basename(path);
              final source = ContextSource.file(
                  canRead: true, canWrite: true, path: path, name: name);
              appBloc.add(ContextSourceAdded(source));
            }
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
              final path = file.path;
              final name = p.basename(path);
              final source = ContextSource.file(
                  canRead: true, canWrite: true, path: path, name: name);
              appBloc.add(ContextSourceAdded(source));
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
            final path = await getDirectoryPath();
            if (path != null) {
              final name = p.basename(path);
              final source = ContextSource.directory(
                  canRead: true, canWrite: true, path: path, name: name);
              appBloc.add(ContextSourceAdded(source));
            }
          },
        ),
      ],
    );
  }
}
