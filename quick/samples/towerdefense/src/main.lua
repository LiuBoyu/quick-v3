
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print(debug.traceback(tostring(msg), 2))
    print("----------------------------------------")
end

-- 脚本路径
package.path = "src/?.lua;../../?.lua"

-- 启动函数
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("res/")

require("config")
require("cocos.init")
require("framework.init")
require("utils")

display.addSpriteFrames("SheetMapBattle.plist", "SheetMapBattle.png")
display.addSpriteFrames("SheetEditor.plist", "SheetEditor.png")

display.replaceScene(require("editor.EditorScene").new())
