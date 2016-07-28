
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print(debug.traceback(tostring(msg), 2))
    print("----------------------------------------")
end

-- 脚本路径
package.path = "src/?.lua;../?.lua"

-- 启动函数
require("app.WelcomeApp").new():run()

