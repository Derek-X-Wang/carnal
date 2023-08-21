# Carnal
> 🚧 : Carnal is currently in early development. Many features may not be fully functional.
### Your Computer as a Knowledge Base Working Seamlessly with Language Models Like OpenAI's GPT

## Overview
Carnal is designed to leverage the power of Language Models (LLM) such as GPT from OpenAI to help users manage local files on their computer. With Carnal, you can read, modify, and delete local files and folders using natural language commands.

Currently tested on macOS, Carnal aims to provide support for Windows and Linux in the near future.

## Motivation
Inspired by projects like [Kaguya](https://github.com/ykdojo/kaguya) and [Quivr](https://github.com/StanGirard/quivr), Carnal is designed to stay simple and accessible. It doesn't require extra dependencies like ChatGPT or Docker, making it frictionless for everyone to use. Just install the Carnal desktop app, and you're ready to explore a new way to interact with your files.

## Features
- **Read, Modify, and Delete Files**: Manage your local files effortlessly with natural language commands.
- **Cross-Platform Support**: Though currently tested on macOS, Windows and Linux support is coming soon.
- **No Extra Dependencies**: Carnal is built with simplicity in mind, with no need for complex setups or extra tools.
  
## Support

Having trouble? DM me at [Twitter](https://twitter.com/derekxinzhewang).

## Getting Started
### Installation
Downloadable artifacts are coming soon. Stay tuned for a hassle-free installation experience.

### Development
To run Carnal in development mode, you can use the following command:
1. Rename `.env.sample` to `.env`.
2. Provide your own OpenAI API key in the `.env` file.
3. Run the following command:

```bash
flutter run -d macos
```

Or, if you're using VSCode, simply launch "Debug Carnal MacOS."

> ❗️ For macOS: App Sandbox is disabled because Carnal needs to access your local files. This means that Carnal will not be available on the App Store. If you're concerned about security, you can build Carnal from source.

## Contribute
To contribute to this project, please follow a
["fork and pull request"](https://github.com/firstcontributions/first-contributions) workflow.

The project follows [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages.
This allows us to automatically generate the changelog and release notes.

## Credits
Carnal was inspired by the following projects:
- [Kaguya](https://github.com/ykdojo/kaguya)
- [Quivr](https://github.com/StanGirard/quivr)

## License
Carnal is licensed under the MIT License. Feel free to contribute, modify, and share.

---
Enjoy using Carnal? Star the repo to show your support!

## Next steps
- [ ] Improve the ability to handle multiple files at the same times
- [ ] Full text search for memory
- [ ] Refactor Globs matching logic for ignored files
- [ ] System tray
- [ ] Shift+Enter for new line when chatting
- [ ] Imporve ui when the agent is thinking