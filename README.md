# Codebase-Generator
A shell script that generates a text file of your entire codebase, with all files being delimited so they're easy to understand for an LLM. 

Just copy the script to your repo, make sure it is executable by running

chmod +x generate_codebase.sh

Then run ./generate_codebase.sh to execute the script. 

This is super useful if you use a bash alias to automate script execution and git commands. 

An example would be pasting something like this into your ~/.bashrc file...

alias ship_super='cd /path/to/my/repo/myreponame && ./generate_codebase.sh && git add . && git commit -m "vibe coding" && git push origin master'

That way, you can vibe code with GPT, Gemini, Deepseek, etc quicker. 

Just go to the codebase_contexts.txt file in your github, and copy paste it into the LLM. 

DON'T BE AN IDIOT AND FORGET TO INCLUDE MASSIVE FOLDERS LIKE node_modules IN THE IGNORE LIST IN THE SCRIPT. THIS WILL PROBABLY CRASH YOUR COMPUTER. BE CAREFUL.
