library agent_repository;

import 'package:agent_repository/src/tools/directory_list.dart';
import 'package:agent_repository/src/tools/file_get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

/// {@template agent_repository}
/// Service which manages agent.
/// {@endtemplate}
class AgentRepository {
  /// {@macro agent_repository}
  AgentRepository({
    OpenAIFunctionsAgent? agent,
  }) : _agent = agent ??
            OpenAIFunctionsAgent.fromLLMAndTools(
              llm: ChatOpenAI(
                apiKey: dotenv.env['OPENAI_API_KEY'],
                model: 'gpt-3.5-turbo-0613',
                temperature: 0,
              ),
              tools: [DirectoryListTool(), FileGetTool()],
            );
  final OpenAIFunctionsAgent _agent;

  // You can add other methods and properties here
  Future<String> execute(String input) async {
    final executor = AgentExecutor(agent: _agent);
    final response = await executor.run(input);
    return response;
  }
}
