# godot-ai-toolkit
An interaction layer between Godot and AI apis/tools to accelerate developing games with AI. Our entry for the 2022 Assembly AI Hackathon.

Updated April 4th, 2023 to support Godot 4.0.1 and recent API changes.

# Our Team

This project was made by a team of two:
- Zack (@zack_licastro on devpost)
- Amanda (@areuillo on devpost)

# Goal

The goal for this project is to create a toolkit to help interface between Godot and AI APIs to help game developers easily create more personalized experiences.

# Completed Work

An addon for Godot was successfully made to facilitate configuring integrated APIs from within the Godot user interface.

Integrations were completed for the following APIs:
- co:here (used for semantic analysis). See more at [co:here's website](https://cohere.ai/)
- OpenAI GPT (used for text generation). See more at [OpenAI's website](https://openai.com/)

These were then used in two sample scenes to demonstrate how they can be used in practice for game development.

# Asset References

All art resources were made during the hackathon using AI sources.

Art created with NovelAI:
- Sample visual novel date character

Art created with Midjourney:
- Project icon
- Sample visual novel backdrop
- Sample rpg professor
- Sample rpg sword

Images were processed using the Pinta application.

# Future Work

Future work could likely be focused mainly on three aspects:

1. More integrations, and ease of adding new integrations. These could include:
    - Add Uberduck to allow characters to speak written or generated dialog
    - Add Assembly AI for easy subtitle creation
    - Add Stability AI for generating dynamic backdrops or other personalized content


2. Ease of use/adoptability. We think the available AI tools can already be helpful in their current form, and the next focus in the industry are tools like this to help spread adoption and awareness of what AI can do for creators and businesses.

3. Updating the project to support GPT chat completiton endpoints.

# Setup

1. Download and extract Godot 4.0.x from https://godotengine.org/download/windows/

It was made using the standard build of Godot (not .NET)

2. Git clone the project

```shell
git clone https://github.com/CheesyLaZanya/godot-ai-toolkit.git
```

3. Create a "secrets" folder inside the path "godot-ai-toolkit\godot-ai-toolkit\addons\ai_toolkit"

4. Import the project using the project.godot file found inside the inner godot-ai-toolkit

5. On the left, use our toolkit to configure an OpenAI api key (and change any desired parameters), and a co:here api key

6. Run the project and try out the sample visual novel or sample RPG to see a small slice of what AI integration with Godot can look like
