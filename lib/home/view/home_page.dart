import 'package:agent_repository/agent_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/home/widgets/message_input_view.dart';
import 'package:carnal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carnal/home/home.dart';
import 'package:profiles_repository/profiles_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
        create: (context) => HomeBloc(
          authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
          profilesRepository:
              RepositoryProvider.of<ProfilesRepository>(context),
          agentRepository: RepositoryProvider.of<AgentRepository>(context),
        ),
        child: HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.windowResize();
      bloc.scrollController.animateTo(
        bloc.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: buildToolbar(context),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildMessages(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return SizedBox(
      key: bloc.messagesViewKey,
      width: double.infinity,
      height: 370,
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return ListView.builder(
          controller: bloc.scrollController,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(state.messages[index].message));
          },
        );
      }),
    );
  }

  Widget _buildInputView(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return SizedBox(
      key: bloc.inputViewKey,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MessageInputView(
            focusNode: bloc.focusNode,
            controller: bloc.editingController,
            isAgentExecuting: false,
            onButtonTappedClear: () {
              // bloc.add(const HomeMessageInputChanged(''));
              bloc.editingController.clear();
            },
            onButtonTappedSend: () {
              bloc.add(HomeMessageSent());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildMessages(context),
          _buildInputView(context),
        ],
      ),
    );
  }
}
