import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/mouth/mouth.dart';

class MouthPage extends StatelessWidget {
  const MouthPage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: MouthPage());

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return Material(
      child: BlocProvider(
        create: (context) => MouthBloc(),
        child: MouthView(),
      ),
    );
  }
}

class MouthView extends StatelessWidget {
  MouthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mouth'),
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
                // Handle navigation or any action related to the Mouth
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
            ListTile(
              title: Text('Hand'),
              onTap: () {
                // Handle navigation or any action related to the hand
                context.go('/hand');
              },
            ),
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
      body: _buildMain(context),
    );
  }

  Widget _buildMain(BuildContext context) {
    final bloc = BlocProvider.of<MouthBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.scrollController.animateTo(
        bloc.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
    return BlocBuilder<MouthBloc, MouthState>(builder: (context, state) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        bloc.scrollController.animateTo(
          bloc.scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });

      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: bloc.scrollController,
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.messages[index].message));
              },
            ),
          ),
          _buildInputArea(context),
        ],
      );
    });
  }

  void _onSent(BuildContext context) {
    final bloc = BlocProvider.of<MouthBloc>(context);
    if (bloc.editingController.text.isEmpty) return;
    bloc.add(MessageAdded(MessageItem(
        kind: UserKind.user,
        message: bloc.editingController.text,
        dateTime: DateTime.now())));
    bloc.editingController.clear();
  }

  // not working
  Widget _buildKeyboardListener(BuildContext context) {
    final bloc = BlocProvider.of<MouthBloc>(context);
    return RawKeyboardListener(
      focusNode: bloc.keyboardFocusNode,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          if (event.isShiftPressed || event.isControlPressed) {
            // Shift + Enter or Control + Enter: Add a newline
            bloc.editingController.text += '\n';
            bloc.keyboardFocusNode.requestFocus();
            // bloc.editingController.selection = TextSelection.collapsed(
            //   offset: bloc.editingController.text.length,
            // );
          } else {
            // Enter: Submit the message
            _onSent(context);
          }
        }
      },
      child: _buildInputArea(context),
    );
  }

  // TODO: Allow shift+enter to add a newline
  Widget _buildInputArea(BuildContext context) {
    final bloc = BlocProvider.of<MouthBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: bloc.editingController,
              decoration: InputDecoration(
                hintText: 'Type here...',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null, // Allows the text field to grow with content
              textInputAction: TextInputAction.send, // Override Enter behavior
              onSubmitted: (text) {
                // Define what should happen when Enter is pressed
              },
              onChanged: (text) {
                // Logic for handling changes in the text
              },
              // Custom handling of Enter and Shift+Enter
              onEditingComplete: () {
                _onSent(context);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _onSent(context);
            },
          ),
        ],
      ),
    );
  }
}
