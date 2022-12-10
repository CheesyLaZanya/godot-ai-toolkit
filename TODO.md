# Description

Todo and idea list for our Godot AI Toolkit entry to the Assembly AI 2022 Hackathon

# Todo

Here are the things we've identified need done to complete this hackathon/project.

- [x] Setup public GitHub repo for project
- [x] Add team member to collaborators
- [x] Setup todo and idea list section for collaboration
- [x] Dump initial idea list
- [x] Add initial Godot Project
- [ ] Sign up for devpost accounts
- [x] Find documentation on creating Godot plugins
    https://docs.godotengine.org/en/latest/tutorials/plugins/editor/making_plugins.html
- [x] Add empty plugin
- [x] Create custom dock
    https://docs.godotengine.org/en/latest/tutorials/plugins/editor/making_plugins.html#a-custom-dock
    - [x] Use LineEdit for secret fields (API Keys)
        https://docs.godotengine.org/en/latest/classes/class_lineedit.html
- [x] Find documentation for calling APIs from Godot
    https://docs.godotengine.org/en/latest/classes/class_httprequest.html
- [x] Make proof of concept of calling Open AI api
- [ ] Add the rest of the configurable parameters to the OpenAI section in the dock
- [ ] Hook dock up to saving API key
- [ ] Hook up rest of dock saving parameters
- [ ] Find documentation on encrypting values in Godot
- [ ] Setup encryption for API keys to allow saving them in project without leaking them in git
- [x] Find documentation on encrypting values in Godot
    https://docs.godotengine.org/en/latest/classes/class_crypto.html
- [x] Create basic encryption PoC
- [ ] Generalize encryption helper
- [ ] Setup encryption for API keys to allow saving them in project without leaking them in git.
- [ ] Finalize plugin information
- [ ] Create setup instructions
- [ ] Create usage information/documentations
- [ ] Retry plugin autoload or remove commented out autoload code 
- [ ] TBD ...

# Ideas

The goal for this project is to create a framework to help interface between Godot and AI APIs to help game developers create more personalized experiences in an easy way.

## Rough Ideas
- Ideally make this a Godot plugin
- Use OpenAI for personalized story interactions?
- Use Co:here for semantic analyze of answers for more appropriate character reactions?
- Use Uberduck to allow characters to speak written or generated dialog?
- Use Assembly AI for easy subtitle creation?
- Use Stability AI for generating dynamic backdrops or other personalized content?