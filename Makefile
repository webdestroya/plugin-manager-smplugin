
SPCOMP = sourcemod/spcomp

OUTPUT = build
PLUGIN_PATH = addons/sourcemod/plugins

SPINCLUDE=sourcemod/include/

SOURCE = src


compile: clean
	mkdir -p $(OUTPUT)
	mkdir -p $(OUTPUT)/$(PLUGIN_PATH)
	$(SPCOMP) $(SOURCE)/plugin_manager.sp -o$(OUTPUT)/$(PLUGIN_PATH)/plugin_manager.smx -i$(SOURCE) -i$(SPINCLUDE) -v2

clean:
	rm -rf $(OUTPUT)

zip: compile
	cd $(OUTPUT)
	zip -r plugin_manager.zip addons