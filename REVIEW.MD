# Project review

You will find #TODO comments in files when some rework is needed.

# Requirements.txt

This file should contain external librairies needed for this project.
You can use this command to generate the requirements.txt file.
```
pip freeze > requirements.txt
```

#General comments

- Remove unneeded files
- Remove unneeded comments
- Include migrations files in the repo
- Use black library to fix code syntax following PEP8 standards
- Use ClassBasedViews instead of function based views (Useful because of inheritance concept and not recreate the wheel)
- Use pylint to fix style (e.g: add docstring for classes and functions)

# Create a README.md file

This file is used for documentation purpose to help other developers to setup environment to run the project locally.
It should contain the following sections:
- Project name
- Short description
- Create a virtual environment for the project + command
- How to install dependencies if needed in the project + command
- How to sync migration files with db
- How to run the project + command
- How to test the project + command
- Additional notes (e.g: Future features) - Optional