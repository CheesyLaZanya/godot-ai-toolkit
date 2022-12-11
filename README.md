# godot-ai-toolkit
An interaction layer between Godot and AI apis/tools to accelerate developing games with AI. Our entry for the 2022 Assembly AI Hackathon.

# Our Team

This project was made by a team of two:
- Zack (@zack_licastro on devpost)
- Amanda (@areuillo on devpost)

# Goal

The goal for this project is to create a toolkit to help interface between Godot and AI APIs to help game developers easily create more personalized experiences.

# Completed Work

A plugin for Godot was successfully made to facilitate configuring integrated APIs from within the Godot user interface.

Integrations were completed for the following APIs:
- co:here (used for semantic analysis). See more at [https://cohere.ai/](co:here's website)
- OpenAI GPT (used for text generation). See more at [https://openai.com/](OpenAI's website)

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

Future work would likely be focused mainly on two aspects:

1. More integrations, and ease of adding new integrations. These could include:
    - Add Uberduck to allow characters to speak written or generated dialog
    - Add Assembly AI for easy subtitle creation
    - Add Stability AI for generating dynamic backdrops or other personalized content


2. Ease of use/adoptability. We think the available AI tools can already be helpful in their current form, and the next focus in the industry are tools like this to help spread adoption and awareness of what AI can do for creators and businesses.

# Setup

1. Download Godot 4.0 Beta 7

This project was made for the latest Godot 4 beta build (Godot 4.0 Beta 7 at the time of writing).
It uses the standard build of Godot (not .NET)
Godot 4.0 Beta 7 can be found here: [https://godotengine.org/article/dev-snapshot-godot-4-0-beta-7#downloads](https://godotengine.org/article/dev-snapshot-godot-4-0-beta-7#downloads)

2. Git clone the project

```shell
git clone https://github.com/zkenshin/godot-ai-toolkit.git
```

3. Open the inner godot-ai-toolkit folder in Godot (via import project)

4. On the left, use our toolkit to configure an OpenAI api key (and change any desired parameters), and a Co:here api key

5. Run the project and try out the sample visual novel to see a small slice of what AI integration with Godot can look like.