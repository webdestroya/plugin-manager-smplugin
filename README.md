# SourceMod Plugin Manager

This plugin allows your game server to find and install plugins easily using RCON.


## Usage
* `pm_search <query>` - This searches for plugins that match the provided query.
* `pm_check` - This will check all installed plugins to see if there is a new version available.
* `pm_list` - This will list your installed plugins and versions
* `pm_upgrade <PluginID>` - This will upgrade the plugin to the latest version. You can see a list of PluginIDs by using `pm_list`
* `pm_install <plugin_name>` - This will install the plugin and download all files required for the plugin. 


## Installation

### Requirements
* [SourceMod](http://www.sourcemod.net/)
* [sourcemod-curl-extension](http://code.google.com/p/sourcemod-curl-extension/)

## Development
You can use `make compile` to compile the plugin. If you want to create a Zip archive to install on your game server, you can run `make zip` which will create a zip archive inside the `build/` folder.


## License
Please the `LICENSE` file.