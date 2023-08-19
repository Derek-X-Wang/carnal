library agent_repository;

import 'package:agent_repository/src/tools/directory_create.dart';
import 'package:agent_repository/src/tools/directory_list.dart';
import 'package:agent_repository/src/tools/file_append.dart';
import 'package:agent_repository/src/tools/file_create.dart';
import 'package:agent_repository/src/tools/file_read.dart';
import 'package:agent_repository/src/tools/file_replace.dart';
import 'package:agent_repository/src/tools/file_update.dart';
import 'package:agent_repository/src/tools/files_read.dart';
import 'package:agent_repository/src/tools/path_delete.dart';
import 'package:agent_repository/src/tools/path_rename.dart';
import 'package:agent_repository/src/tools/path_search.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

/// {@template agent_repository}
/// Service which manages agent.
/// {@endtemplate}
class AgentRepository {
  /// {@macro agent_repository}
  AgentRepository({
    ConversationBufferMemory? memory,
  }) : _memory = memory ?? ConversationBufferMemory(returnMessages: true);
  final ConversationBufferMemory _memory;

  // You can add other methods and properties here
  Future<String> execute(String input, List<String> paths) async {
    final systemChatMessage = SystemChatMessagePromptTemplate.fromTemplate('''
I want you to act as a local file assistant which help the user to manage files and directories.
You have the permission to access following paths and sub-paths: ${paths.join(',')}
When trying to access a path that not included in the permission, just say No Permission.
''');
    final tools = [
      PathSearchTool(),
      PathRenameTool(),
      PathDeleteTool(),
      DirectoryListTool(),
      DirectoryCreateTool(),
      FileReadTool(),
      FileAppendTool(),
      FileCreateTool(),
      FileReplaceTool(),
      FileUpdateTool(),
      FilesReadTool(),
    ];
    final llm = ChatOpenAI(
      apiKey: dotenv.env['OPENAI_API_KEY']!,
      model: 'gpt-3.5-turbo-0613',
      temperature: 0,
    );
    final prompt = ChatPromptTemplate.fromPromptMessages([
      systemChatMessage,
      const MessagePlaceholder(
        variableName: OpenAIFunctionsAgent.agentInputKey,
      ),
      const MessagesPlaceholder(
        variableName: BaseActionAgent.agentScratchpadInputKey,
      ),
    ]);
    final agent2 = OpenAIFunctionsAgent(
      llmChain: LLMChain(
        llm: llm,
        llmOptions: ChatOpenAIOptions(
          functions: tools
              .map((final t) => t.toChatFunction())
              .toList(growable: false),
        ),
        prompt: prompt,
      ),
      tools: tools,
    );
    // final agent = OpenAIFunctionsAgent.fromLLMAndTools(
    //   llm: ChatOpenAI(
    //     apiKey: dotenv.env['OPENAI_API_KEY'],
    //     model: 'gpt-3.5-turbo-0613',
    //     temperature: 0,
    //   ),
    //   tools: [
    //     DirectoryListTool(),
    //     DirectoryCreateTool(),
    //     DirectoryDeleteTool(),
    //     DirectoryRenameTool(),
    //     FileReadTool(),
    //     FileAppendTool(),
    //     FileCreateTool(),
    //     FileDeleteTool(),
    //     FileRenameTool(),
    //     FileReplaceTool(),
    //     FileUpdateTool(),
    //     FilesReadTool(),
    //     PathSearchTool(),
    //   ],
    //   // memory: _memory,
    //   systemChatMessage: systemChatMessage,
    // );
    final executor = AgentExecutor(
        agent: agent2,
        memory: _memory,
        // maxIterations: 5,
        earlyStoppingMethod: AgentEarlyStoppingMethod.force);
    final response = await executor.run(input);
    // final outputKey = executor.runOutputKey;
    // final returnValues = await executor.call(input, returnOnlyOutputs: false);
    // final response = returnValues[outputKey].toString();
    return response;
  }
}
