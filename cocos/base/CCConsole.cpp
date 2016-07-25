/****************************************************************************
 Copyright (c) 2013-2014 Chukong Technologies Inc.

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#include "base/CCConsole.h"

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#include "base/CCDirector.h"
#include "base/CCConfiguration.h"
#include "platform/CCPlatformConfig.h"

NS_CC_BEGIN

#if (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32)
void SendLogToWindow(const char *log)
{
    // Send data as a message
    COPYDATASTRUCT myCDS;
    myCDS.dwData = 1;
    myCDS.cbData = (DWORD)strlen(log) + 1;
    myCDS.lpData = (PVOID)log;
    if (Director::getInstance()->getOpenGLView())
    {
        HWND hwnd = Director::getInstance()->getOpenGLView()->getWin32Window();
        SendMessage(hwnd,
            WM_COPYDATA,
            (WPARAM)(HWND)hwnd,
            (LPARAM)(LPVOID)&myCDS);
    }
}
#endif

//
// Free functions to log
//

static void _log(const char *format, va_list args)
{
    char buf[MAX_LOG_LENGTH];

    vsnprintf(buf, MAX_LOG_LENGTH-3, format, args);
    strcat(buf, "\n");

#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
    __android_log_print(ANDROID_LOG_DEBUG, "cocos2d-x debug info",  "%s", buf);

#elif CC_TARGET_PLATFORM ==  CC_PLATFORM_WIN32 || CC_TARGET_PLATFORM == CC_PLATFORM_WINRT || CC_TARGET_PLATFORM == CC_PLATFORM_WP8

    #if (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32)
    SendLogToWindow(buf);
    #endif

    WCHAR wszBuf[MAX_LOG_LENGTH] = {0};
    MultiByteToWideChar(CP_UTF8, 0, buf, -1, wszBuf, sizeof(wszBuf));
    OutputDebugStringW(wszBuf);
    WideCharToMultiByte(CP_ACP, 0, wszBuf, -1, buf, sizeof(buf), nullptr, FALSE);
    printf("%s", buf);
    fflush(stdout);
#else
    // Linux, Mac, iOS, etc
    fprintf(stdout, "%s", buf);
    fflush(stdout);
#endif
}

// FIXME: Deprecated
void CCLog(const char * format, ...)
{
    va_list args;
    va_start(args, format);
    _log(format, args);
    va_end(args);
}

void log(const char * format, ...)
{
    va_list args;
    va_start(args, format);
    _log(format, args);
    va_end(args);
}

NS_CC_END
