Hello

Thank you for taking a look at our project, Godot API Toolkit, which was made by a team of two for the Assembly AI Hackathon.

The goal for this project was to help spread the usefulness of existing APIs to create personalized experiences for users by building a toolkit to let the Godot game engine interface with existing AI apis.

In the time we had, we were able to create a Godot addon able to create interfaces to both OpenAI's GPT3, and co:here for semantic analysis, and created two samples of how those may look if implemented by game developers.

On the left, you can see the dock we made for AI configuration, which could be expanded with additional AI APIs in the future. I've already set up my API key and parameters, so I'll just show you one of our samples since we're short on time.

Running the project, I'll choose the Visual Novel sample which uses both GPT3 and co:here.

Starting the scene, you see a standard scenario, where our characters are walking home after a date.

We let the player enter the date location, then process a request to GPT3 in the background while going through a few more dialogs, before returning with content directly inspired by their prompt.

After a short discussion, we ask the player how they felt about the date. We do a similar trick of processing an API call to co:here in the background, then have the state change based on the players feedback about their experience on the date.


In this case, the response I gave was deemed negative, so our date gets upset.

Hopefully this has given you a good idea on the possiblities this could unlock for both game developers and our players as we continue to move towards AI powered solutions!