
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print(debug.traceback(tostring(msg), 2))
    print("----------------------------------------")
end

-- 脚本路径
package.path = "src/?.lua;../../?.lua"

-- 启动函数
cc.FileUtils:getInstance():setPopupNotify(false);
require("app.MyApp").new():run()
