import 'package:carnal/utils/agent/directory_list.dart';
import 'package:carnal/utils/agent/file_get.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final llm = ChatOpenAI(
  apiKey: dotenv.env['OPENAI_API_KEY'],
  model: 'gpt-3.5-turbo-0613',
  temperature: 0,
);

final tools = [DirectoryListTool(), FileGetTool()];

final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);
