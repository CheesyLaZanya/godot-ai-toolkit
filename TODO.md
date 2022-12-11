# Description

Todo file for our Godot AI Toolkit entry to the Assembly AI 2022 Hackathon


# Todo

Here are the things we've identified need done to complete this hackathon/project.

- [x] Setup public GitHub repo for project
- [x] Add team member to collaborators
- [x] Setup todo and idea list section for collaboration
- [x] Dump initial idea list
- [x] Add initial Godot Project
- [x] Sign up for devpost accounts
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
- [x] Add the rest of the configurable parameters to the OpenAI section in the dock
- [x] Hook dock up to saving API key
- [x] Hook up rest of dock saving parameters
- [x] Find documentation on encrypting values in Godot
    https://docs.godotengine.org/en/latest/classes/class_crypto.html
- [x] Create basic encryption PoC
- [x] Generalize encryption helper
- [x] Setup encryption for API keys to allow saving them in project without leaking them in git.
- [x] Add parameter saving and loading
- [x] Used saved parameters in test api call
- [x] Look at collapsible dock sections for different AI/APIs
- [x] Setup example start scene that links to others
- [x] Make sample visual novel date
    - [x] Where did you go on a date?
        - [x] Have open AI describe the date briefly.
    - [x] Ask how they enjoyed the date
        - [x] Have date respond based on Cohere analysis, use "where" in task description.
- [x] Make sample RPG Intro
    - [x] Ask for name
        - [x] Comment on how "fantasy" the name is or isn't?
    - [x] Ask for their chosen weapon
        - [x] Respond sarcastically about it
- [x] Cleanup example start scene that links to others (or remove if only one finished)
- [x] Review if we're completing the RPG or not and update our readme if so.
- [x] Either fix secret folder starting in the project, or add to instructions to create it.
- [x] Make Co:here API easier to use
- [x] Split API key out from parameters
- [x] Code refactor/improvement
- [x] Create project icon
- [x] Finalize plugin information
- [x] Create setup instructions
- [x] Create usage information/documentation
- [ ] Make simple presentation notes/scripts
- [ ] Record project demo
- [ ] Submit on devpost as team

# Future Todo

- [ ] Make plugin autoload all singleton's automatically.