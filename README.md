# DayZ-Mod-Template

Complete DayZ Mod Template

## Installation

Navigate to your project folder in any terminal of your choice, I use command prompt. **Important:** Do not clone inside of your P:\ drive - This process is done outside of your Workdrive folder.

```
# Clone the repository onto your PC
git clone --depth 1 https://github.com/InclementDab/DayZ-Mod-Template.git DayZ-Mod-Name

# Go to your newly cloned folder
cd DayZ-Mod-Name

# Run setup batch
./Install.ps1

# Remove old .git folder
rm -rf .git

# Initialize a new git repository
git init

# Add all new files and commit
git add .
git commit -m "Initial commit"
```

### How It Works
This mod template will offload all backend work to Workbench. A few features can be noted below
- Settings and project management are handled inside of workbench. Ctrl + F6 to modify settings
- Missions and Profiles are managed internally per-project. Each project is managed by its prefix individually in your P drive


### Shortcuts

### Setup
```
1.) Clone the following repositories to your PC. Do NOT put them on your P: drive. You can use your favorite Git client, most of us use Github Desktop
https://github.com/InclementDab/DayZ-Dabs-Framework
https://github.com/Arkensor/DayZ-CommunityFramework

2.) Clone your new templated repository onto your PC. Using your favorite text editor, rename all instances of ModTemplate to YourModPrefix, including the two folders

3.) In all three repositories, there is a "SetupWorkdrive.bat" file. Run this after you've finished cloning / downloading.

4.) Navigate to P:/YourModPrefix/Workbench (this will be created by the SetupWorkdrive.bat)

5.) Double click dayz.gproj - if prompted to run with an application, be sure to choose Workbench (you can find this in steamapps/common/DayZ Tools/Bin/Workbench)

6.) Upon opening workbench, navigate to Workbench -> Options on the top navbar. Set "Source Data Directory" to your DayZ install location (example: C:/Program Files (x86)/Steam/steamapps/common/DayZ Exp). Restart workbench when prompted. (Upon restarting you will need to close and reopen P:/YourModPrefix/dayz.gproj)

7.) Navigate to Plugins -> Settings -> Configure Project (note: if the plugins folder is empty, you may need to click 'Settings -> Reload WB Scripts')

8.) Set the Repository value to the installation location of your downloaded mod. (example: C:\Dev\proj\DayZ-Mod-Prefix)

9.) (optional) Enable FilePatching in your configuration. This will be handled by the plugin automatically and load scripts / gui ingame without a repack required.

10.) Press F6, or Plugins -> Launch Game . If you've installed everything properly (and have all of our mods downloaded) your game will launch with a virtual mission created in your P:/ drive. 

11.) (not optional) Make some badass mods 

```

Any folders inside of the ModTemplate directory will be converted into PBO's (excluding the Workbench folder)


DayZ Workbench Wiki:
https://community.bistudio.com/wiki/DayZ:Workbench_Script_Debugging#Filepatching


## License

Your tool is licensed under [MIT License](LICENSE.md).

---

For any additional questions or feedback, please raise an issue in this repository or contact [Tyler Paul](mailto:tylerpaul2329@gmail.com).
```