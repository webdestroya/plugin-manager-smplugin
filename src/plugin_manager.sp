#pragma semicolon 1
#include <sourcemod>
#include <regex>
#include <cURL>

#define USE_THREAD    1
#define USE_PROFILER    1

#if USE_PROFILER
  #include <profiler>
#endif

#define PM_VERSION "1.0.0-dev"

#define PM_URL_SEARCH        "http://mitchdb.herokuapp.com/api/v2/ping"
#define PM_URL_CHECK         "http://mitchdb.herokuapp.com/api/v2/bans?api_key=%s"




public Plugin:myinfo = 
{
  name = "Plugin Manager",
  author = "Mitch Dempsey (WebDestroya)",
  description = "Plugin Manager for SourceMod",
  version = PM_VERSION,
  url = "http://manager.webdestroya.com/"
};

new CURL_Default_opt[][2] = {
#if USE_THREAD
  {_:CURLOPT_NOSIGNAL,1},
#endif
  {_:CURLOPT_NOPROGRESS,1},
  {_:CURLOPT_TIMEOUT,40},
  {_:CURLOPT_CONNECTTIMEOUT,30},
  {_:CURLOPT_VERBOSE,0}
};

#define CURL_DEFAULT_OPT(%1) curl_easy_setopt_int_array(%1, CURL_Default_opt, sizeof(CURL_Default_opt))


#include <plugin_manager/check.sp>
#include <plugin_manager/search.sp>

public OnPluginStart() {

  CreateConVar("plugin_manager_version", PM_VERSION, "Plugin Manager", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);

  RegServerCmd("pm_search", Command_Search, "Searches for a plugin.");
  RegServerCmd("pm_check", Command_Check, "Checks to see if any updates are available for any installed plugins.");
}

