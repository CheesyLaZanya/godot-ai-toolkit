# About the project

## Inspiration

We love AI for the personalized experiences it can give users, and we love games. But we haven't seen enough AI usage in games, especially among the indie community who typically loves to experiment and break new ground.

What if we could make it easier for them to use existing AI tools in their games to help drive the industry forward?

## What it does

We created a AI toolkit for Godot (a cross-platform, free and open-source game engine popular among indie game developers) to help facilitate setting up and using third party AI APIs.

Specifically, we made an addon to Godot itself, which adds a new AI configuration dock to the UI, which can let you set your API keys and AI parameters directly from the Godot user interface.

We also created scripts to help developers use and manage these API parameters and calls.

## How we built it

Our project was built mostly using Godot's native gdscript.

With the time we had, we were able to set up interfaces for OpenAI's GPT3, and co:here for sentiment analysis.

For the sample projects we included, we created AI art using a mix of Midjourney and NovelAI.

## Challenges we ran into

We struggled for a while dealing with aspects such as storing API keys in a somewhat secure way for developers while they work, as cryptography isn't necessarily playing to Godot's strength.

## Accomplishments that we're proud of

We're proud of the fact that we tackled a bunch of things we didn't really have experience with, from using new APIs, to creating a addon for Godot, and managed to submit something within the time limits of the hackathon.

We also managed to not only create the addon we were hoping for, but were able to include two sample projects, which would be essential for developer adoption.

## What we learned

- How to use OpenAI's GPT3 API
- How to use co:here's API for semantic analysis
- How to create addons for Godot
- How to perform API calls from Godot
- How to do encryption in Godot


## What's next for Godot AI Toolkit

Future work would likely be focused mainly on two aspects:

1. More integrations, and ease of adding new integrations. These could include:
    - Add Uberduck to allow characters to speak written or generated dialog
    - Add Assembly AI for easy subtitle creation
    - Add Stability AI for generating dynamic backdrops or other personalized content


2. Ease of use/adoptability. We think the available AI tools can already be helpful in their current form, and the next focus in the industry are tools like this to help spread adoption and awareness of what AI can do for creators and businesses.

# Built with

Godot, gdscript, OpenAI, GPT3, co:here, midjourney, novelai

# "Try it out" links

https://github.com/zkenshin/godot-ai-toolkit

# Image Gallary
- Homepage with VN selected
- Professor name comment
- VN date comment

# Video demo link

TBD