
#include "AppDelegate.h"
#include "SimpleAudioEngine.h"
#include "CCLuaEngine.h"

#include "lua_module_register.h"

#include <unistd.h>

USING_NS_CC;
using namespace CocosDenshion;
using namespace std;

AppDelegate::AppDelegate()
{
}

AppDelegate::~AppDelegate()
{
    SimpleAudioEngine::end();
}

//if you want a different context,just modify the value of glContextAttrs
//it will takes effect on all platforms
void AppDelegate::initGLContextAttrs()
{
    //set OpenGL context attributions,now can only set six attributions:
    //red,green,blue,alpha,depth,stencil
    GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};
    
    GLView::setGLContextAttrs(glContextAttrs);
}

bool AppDelegate::applicationDidFinishLaunching()
{
    // initialize director
    auto director = Director::getInstance();
    director->setProjection(Director::Projection::_2D);
    
    // turn on display FPS
    director->setDisplayStats(true);
    
    // set FPS. the default value is 1.0/60 if you don't call this
    director->setAnimationInterval(1.0 / 60);
    director->startAnimation();
    
    // register lua engine
    auto engine = LuaEngine::getInstance();
    ScriptEngineManager::getInstance()->setScriptEngine(engine);
    lua_State* L = engine->getLuaStack()->getLuaState();
    
    // register lua module
    lua_module_register(L);
    
    engine->getLuaStack()->setXXTEAKeyAndSign("CoconutGames", strlen("CoconutGames"), "XT", strlen("XT"));
    
    StartupCall *call = StartupCall::create(this);
    call->startup();
    
    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground()
{
    Director::getInstance()->stopAnimation();
    Director::getInstance()->pause();
    
    SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
    SimpleAudioEngine::getInstance()->pauseAllEffects();
    
    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("APP_ENTER_BACKGROUND_EVENT");
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    Director::getInstance()->resume();
    Director::getInstance()->startAnimation();
    
    SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
    SimpleAudioEngine::getInstance()->resumeAllEffects();
    
    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("APP_ENTER_FOREGROUND_EVENT");
}

void AppDelegate::setProjectConfig(const ProjectConfig& project)
{
    _project = project;
}

// ----------------------------------------

StartupCall *StartupCall::create(AppDelegate *app)
{
    StartupCall *call = new StartupCall();
    call->_app = app;
    call->autorelease();
    return call;
}

void StartupCall::startup()
{
    // cd project path
    const ProjectConfig &project = _app->_project;
    chdir(project.getProjectDir().c_str());
    
    // load script
    auto engine = LuaEngine::getInstance();
    string env = "";
    
#if COCOS2D_DEBUG
    env.append("COCOS2D_DEBUG    = 1                                                            \n");
#endif
    
#if CC_USE_CURL
    env.append("CC_USE_CURL      = 1                                                            \n");
#endif
#if CC_USE_WEBSOCKET
    env.append("CC_USE_WEBSOCKET = 1                                                            \n");
#endif
#if CC_USE_SQLITE
    env.append("CC_USE_SQLITE    = 1                                                            \n");
#endif
#if CC_USE_CCSTUDIO
    env.append("CC_USE_CCSTUDIO  = 1                                                            \n");
#endif
#if CC_USE_SPINE
    env.append("CC_USE_SPINE     = 1                                                            \n");
#endif
#if CC_USE_PHYSICS
    env.append("CC_USE_PHYSICS   = 1                                                            \n");
#endif
#if CC_USE_TMX
    env.append("CC_USE_TMX       = 1                                                            \n");
#endif
#if CC_USE_FILTER
    env.append("CC_USE_FILTER    = 1                                                            \n");
#endif
#if CC_USE_NANOVG
    env.append("CC_USE_NANOVG    = 1                                                            \n");
#endif
    
    engine->executeString(env.c_str());
    
    // load script
    string bootstrap_u = FileUtils::getInstance()->getWritablePath() + "var/update/res/bootstrap.zip";
    string bootstrap_o = FileUtils::getInstance()->getSearchRootPath()          + "res/bootstrap.zip";
    
    if      (FileUtils::getInstance()->isFileExist(bootstrap_u))
    {
        engine->executeString(("print 'loading " + bootstrap_u + "'").c_str());
        engine->getLuaStack()->loadChunksFromZIP(FileUtils::getInstance()->fullPathForFilename(bootstrap_u).c_str());
        engine->executeString("require 'main'");
    }
    else if (FileUtils::getInstance()->isFileExist(bootstrap_o))
    {
        engine->executeString(("print 'loading " + bootstrap_o + "'").c_str());
        engine->getLuaStack()->loadChunksFromZIP(FileUtils::getInstance()->fullPathForFilename(bootstrap_o).c_str());
        engine->executeString("require 'main'");
    }
    else
    {
        engine->executeString("print 'loading src/main.lua'");
        engine->executeScriptFile("src/main.lua");
    }
}

