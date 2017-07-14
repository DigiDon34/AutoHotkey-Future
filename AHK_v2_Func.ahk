/*
# AutoHotkey v1.1 commands translated as functions using v2.0-a API.

- - -

### Installation:
Copy the entire contents of Lib into a [function library folder](https://autohotkey.com/docs/Functions.htm#lib). Preferably in the user library: `%A_MyDocuments%\AutoHotkey\Lib\\`

### Helpful links:
  * AutoHotkey v2.0-a [online documentation](http://lexikos.github.io/v2/docs/AutoHotkey.htm)
  * [Changes from v1.1 to v2.0](https://autohotkey.com/v2/v2-changes.htm)

### Translation rules _(from changes)_:
  * If the command's first parameter is an output variable and the second parameter is not, it becomes the return value. Otherwise, `RunWait` and `SendMessage` return the value of `ErrorLevel`, and any other commands which set ErrorLevel return 1 on success and 0 on failure. `ErrorLevel` is still set as usual.
  * The remaining output variables are handled like `ByRef` parameters, except that an exception is thrown if the function is called incorrectly. Passing an empty string is equivalent to omitting the parameter, but any other value (which is not a variable reference) is not allowed.

### Notes, limitations and todos:
  * `ListVars()` can only list global variables.
  * `FileInstall()` will only perform a `FileCopy`.
  * `Gui("Add", ...)` - the control's associated variable must be global. Declaring as static is currently impossible.
  * `GuiControl()` and `GuiControlGet()` can only operate on global variables(control's associated variable). Use `ControlHwnd` or `ClassNN` instead if needed.
  * ~~Fix `WinSetXXX()` return values. In `v2.0-a`, `ErrorLevel` is returned. However, most of `WinSet` sub-commands in `v1.1` do not use `ErrorLevel`. Perhaps `ErrorLevel` can be determined using `A_LastError`.~~
  * In v2, `Func("MenuSelect").MinParams` returns `0`. However when called using command syntax, an error is thrown when a required parameter is omitted. There are probably other commands/functions that behave like this. Best to check using `Func` object properties.
  * `Random()` limitation -> how to mimic `Random,, NewSeed`?
  * This is just a rush job, perform proper tests.
  * Improve this README.
*/

BlockInput(Mode)
{
    BlockInput %Mode%
}

Click(Params*)
{
    local i, Param, Args
    for i, Param in Params
        Args .= " " . Param
    Click %Args%
}

ClipWait(SecondsToWait:="", Param:=1)
{
    ClipWait %SecondsToWait%, %Param%
    return !ErrorLevel
}

Control(Cmd, Value:="", Control:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    Control %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

ControlClick(ControlOrPos:="", WinTitle:="", WinText:="", WhichButton:="", ClickCount:="", Options:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlClick %ControlOrPos%, %WinTitle%, %WinText%, %WhichButton%, %ClickCount%, %Options%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

ControlFocus(Control:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlFocus %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

ControlGet(Cmd, Value:="", Control:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    ControlGet OutputVar, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if !ErrorLevel
        return OutputVar
}

ControlGetFocus(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    ControlGetFocus OutputVar, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if !ErrorLevel
        return OutputVar
}

ControlGetPos(ByRef X:="", ByRef Y:="", ByRef Width:="", ByRef Height:="", Control:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlGetPos X, Y, Width, Height, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

ControlGetText(Control:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    ControlGetText OutputVar, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if !ErrorLevel
        return OutputVar
}

ControlMove(Control:="", X:="", Y:="", Width:="", Height:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlMove %Control%, %X%, %Y%, %Width%, %Height%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

ControlSend(Control:="", Keys:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlSend %Control%, %Keys%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

ControlSendRaw(Control:="", Keys:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlSendRaw %Control%, %Keys%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

ControlSetText(Control:="", NewText:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    ControlSetText %Control%, %NewText%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

CoordMode(Param1, Param2:="Screen")
{
    CoordMode %Param1%, %Param2%
}

Critical(Param:="")
{
    Critical %Param%
}

DateAdd(DateTime, Time, TimeUnits)
{
    EnvAdd, DateTime, %Time%, %TimeUnits%
    return DateTime
}

DateDiff(DateTime1, DateTime2, TimeUnits)
{
    EnvSub DateTime1, %DateTime2%, %TimeUnits%
    return DateTime1
}

Deref(String)
{
    local OutputVar
    Transform OutputVar, Deref, %String%
    return OutputVar
}

DetectHiddenText(OnOrOff)
{
    DetectHiddenText %OnOrOff%
}

DetectHiddenWindows(OnOrOff)
{
    DetectHiddenWindows %OnOrOff%
}

DirCopy(Source, Dest, Flag:=0)
{
    FileCopyDir %Source%, %Dest%, %Flag%
    return !ErrorLevel
}

DirCreate(DirName)
{
    FileCreateDir %DirName%
    return !ErrorLevel
}

DirDelete(DirName, Recurse:=0)
{
    FileRemoveDir %DirName%, %Recurse%
    return !ErrorLevel
}

DirExist(FilePattern)
{
    local AttributeString := FileExist(FilePattern)
    return InStr(AttributeString, "D") ? AttributeString : ""
}

DirMove(Source, Dest, Flag:=0)
{
    FileMoveDir %Source%, %Dest%, %Flag%
    return !ErrorLevel
}

DirSelect(StartingFolder:="", Options:=1, Prompt:="")
{
    local OutputVar
    FileSelectFolder OutputVar, %StartingFolder%, %Options%, %Prompt%
    if !ErrorLevel
        return OutputVar
}

Download(URL, FileName)
{
    URLDownloadToFile %URL%, %FileName%
    return !ErrorLevel
}

Drive(SubCommand, Drive:="", Value:="")
{
    Drive %SubCommand%, %Drive%, %Value%
    return !ErrorLevel
}

DriveGet(Cmd, Value:="")
{
    local OutputVar
    if (Cmd != "SpaceFree")
        DriveGet OutputVar, %Cmd%, %Value%
    else
        DriveSpaceFree, OutputVar, %Value%
    if !ErrorLevel
        return OutputVar
}

EnvGet(EnvVarName)
{
    local OutputVar
    EnvGet OutputVar, %EnvVarName%
    return OutputVar
}

EnvSet(EnvVar, Value:="")
{
    EnvSet, %EnvVar%, %Value%
    return !ErrorLevel
}

EnvUpdate()
{
    EnvUpdate
    return !ErrorLevel
}

Exit(ExitCode:=0)
{
    Exit %ExitCode%
}

ExitApp(ExitCode:=0)
{
    ExitApp %ExitCode%
}

FileCopy(Source, Dest, Flag:=0)
{
    FileCopy %Source%, %Dest%, %Flag%
    return !ErrorLevel
}

FileCreateShortcut(Target, LinkFile, WorkingDir:="", Args:="", Description:="", IconFile:="", ShortcutKey:="", IconNumber:="", RunState:=1)
{
    FileCreateShortcut %Target%, %LinkFile%, %WorkingDir%, %Args%, %Description%, %IconFile%, %ShortcutKey%, %IconNumber%, %RunState%
    return !ErrorLevel
}

FileDelete(FilePattern)
{
    FileDelete %FilePattern%
    return !ErrorLevel
}

FileEncoding(Encoding:="")
{
    FileEncoding %Encoding%
}

FileGetAttrib(Filename:="")
{
    local OutputVar
    FileGetAttrib OutputVar, %Filename%
    if !ErrorLevel
        return OutputVar
}

FileGetShortcut(LinkFile, ByRef OutTarget:="", ByRef OutDir:="", ByRef OutArgs:="", ByRef OutDescription:="", ByRef OutIcon:="", ByRef OutIconNum:="", ByRef OutRunState:="")
{
    FileGetShortcut %LinkFile%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
    return !ErrorLevel
}

FileGetSize(Filename:="", Units:="")
{
    local OutputVar
    FileGetSize OutputVar, %Filename%, %Units%
    if !ErrorLevel
        return OutputVar
}

FileGetTime(Filename:="", WhichTime:="M")
{
    local OutputVar
    FileGetTime OutputVar, %Filename%, %WhichTime%
    if !ErrorLevel
        return OutputVar
}

FileGetVersion(Filename:="")
{
    local OutputVar
    FileGetVersion OutputVar, %Filename%
    if !ErrorLevel
        return OutputVar
}

FileInstall(Source, Dest, Flag:=0)
{
    FileCopy %Source%, %Dest%, %Flag%
    return !ErrorLevel
}

FileMove(SourcePattern, DestPattern, Flag:=0)
{
    FileMove %SourcePattern%, %DestPattern%, %Flag%
    return !ErrorLevel
}

FileRead(Filename)
{
    local OutputVar
    FileRead OutputVar, %Filename%
    if !ErrorLevel
        return OutputVar
}

FileRecycle(FilePattern)
{
    FileRecycle %FilePattern%
    return !ErrorLevel
}

FileRecycleEmpty(DriveLetter:="")
{
    FileRecycleEmpty %DriveLetter%
    return !ErrorLevel
}

FileSelect(Options:=0, RootDir_Filename:="", Prompt:="", Filter:="")
{
    local OutputVar
    FileSelectFile OutputVar, %Options%, %RootDir_Filename%, %Prompt%, %Filter%
    if !ErrorLevel
        return OutputVar
}

FileSetAttrib(Attributes, FilePattern:="", OperateOnFolders:=0, Recurse:=0)
{
    FileSetAttrib %Attributes%, %FilePattern%, %OperateOnFolders%, %Recurse%
    return !ErrorLevel
}

FileSetTime(YYYYMMDDHH24MISS:="", FilePattern:="", WhichTime:="M", OperateOnFolders:=0, Recurse:=0)
{
    FileSetTime %YYYYMMDDHH24MISS%, %FilePattern%, %WhichTime%, %OperateOnFolders%, %Recurse%
    return !ErrorLevel
}

FormatTime(YYYYMMDDHH24MISS:="", Format:="")
{
    local OutputVar
    FormatTime OutputVar, %YYYYMMDDHH24MISS%, %Format%
    return OutputVar
}

GroupActivate(GroupName, R:="")
{
    GroupActivate %GroupName%, %R%
    return !ErrorLevel
}

GroupAdd(GroupName, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    GroupAdd %GroupName%, %WinTitle%, %WinText%,, %ExcludeTitle%, %ExcludeText%
}

GroupClose(GroupName, AR:="")
{
    GroupClose %GroupName%, %AR%
}

GroupDeactivate(GroupName, R:="")
{
    GroupDeactivate %GroupName%, %R%
}

Gui(SubCommand, Param1:="", Param2:="", Param3:="", Param4:="")
{
    global ; assume global for vControlVars
    Gui %SubCommand%, %Param1%, %Param2%, %Param3%, %Param4%
}

GuiControl(SubCommand:="", ControlID:="", Param3:="")
{
    global
    GuiControl %SubCommand%, %ControlID%, %Param3%
    return !ErrorLevel
}

GuiControlGet(SubCommand:="", ControlID:="", Param4:="")
{
    global
    local OutputVar
    GuiControlGet OutputVar, %SubCommand%, %ControlID%, %Param4%
    if !ErrorLevel
        return OutputVar
}

Hotkey(Param1, Param2:="", Param3:="")
{
    Hotkey %Param1%, %Param2%, %Param3%
    if (InStr(Param1, "IfWin") || InStr(Param3, "UseErrorLevel"))
        return !ErrorLevel
}

ImageSearch(ByRef OutputVarX:="", ByRef OutputVarY:="", X1:="", Y1:="", X2:="", Y2:="", ImageFile:="")
{
    ImageSearch OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
    return !ErrorLevel
}

IniDelete(Filename, Section, Key:="")
{
    IniDelete %Filename%, %Section%, %Key%
    return !ErrorLevel
}

IniRead(Filename, Section:="", Key:="", Default:="")
{
    local OutputVar
    IniRead OutputVar, %Filename%, %Section%, %Key%, %Default%
    if !ErrorLevel
        return OutputVar
}

IniWrite(Value, Filename, Section, Key:="")
{
    IniWrite %Value%, %Filename%, %Section%, %Key%
    return !ErrorLevel
}

Input(Options:="", EndKeys:="", MatchList:="")
{
    local OutputVar
    Input OutputVar, %Options%, %EndKeys%, %MatchList%
    return OutputVar
}

InputBox(Title:="", Prompt:="", Options:="", Default:="")
{
    local _, _X, _Y, _W, _H, _T, _P, _Err
    ; v2 validates the value of a particular option:
    ; X and Y = integer (can be negative)
    ; W and H = postive integer only
    ; T = postive integer/float
    ; Credits to Lexikos [https://goo.gl/VjMTYu , https://goo.gl/ebEjon]
    RegExMatch(Options, "i)^[ \t]*(?:(?:X(?<X>-?\d+)|Y(?<Y>-?\d+)|W(?<W>\d+)"
        . "|H(?<H>\d+)|T(?<T>\d+(?:\.\d+)?)|(?<P>Password\S?)"
        . "|(?<Err>\S+)(*ACCEPT)"
        . ")(?=[ \t]|$)[ \t]*)*$", _)
    
    if (_Err != "")
        throw Exception("Invalid option.", -1, _Err)
    
    local OutputVar
    InputBox, OutputVar, %Title%, %Prompt%, % _P ? "HIDE" : "", %_W%, %_H%, %_X%, %_Y%,, %_T%, %Default%
    return OutputVar
}

KeyHistory()
{
    KeyHistory
}

KeyWait(KeyName, Options:="")
{
    KeyWait %KeyName%, %Options%
    return !ErrorLevel
}

ListHotkeys()
{
    ListHotkeys
}

ListLines(OnOrOff:="")
{
    ListLines %OnOrOff%
}

ListVars()
{
; Limitation -> won't work if called from within a function
    global
    ListVars
}

Menu(MenuName, Cmd, P3:="", P4:="", P5:="")
{
    Menu %MenuName%, %Cmd%, %P3%, %P4%, %P5%
}

MenuSelect(WinTitle:="", WinText:="", Menu:="", SubMenu1:="", SubMenu2:="", SubMenu3:="", SubMenu4:="", SubMenu5:="", SubMenu6:="", ExcludeTitle:="", ExcludeText:="")
{
    WinMenuSelectItem %WinTitle%, %WinText%, %Menu%, %SubMenu1%, %SubMenu2%, %SubMenu3%, %SubMenu4%, %SubMenu5%, %SubMenu6%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

MonitorGet(N:="", ByRef OutLeft:="", ByRef OutTop:="", ByRef OutRight:="", ByRef OutBottom:="")
{
    local Out
    SysGet Out, Monitor, %N%
    return (OutLeft != "" && OutTop != "" && OutRight != "" && OutBottom != "")
}

MonitorGetCount()
{
    local OutputVar
    SysGet OutputVar, MonitorCount
    return OutputVar
}

MonitorGetName(N:="")
{
    local OutputVar
    SysGet OutputVar, MonitorName
    return OutputVar
}

MonitorGetPrimary()
{
    local OutputVar
    SysGet OutputVar, MonitorPrimary
    return OutputVar
}

MonitorGetWorkArea(N:="", ByRef OutLeft:="", ByRef OutTop:="", ByRef OutRight:="", ByRef OutBottom:="")
{
    local Out
    SysGet Out, MonitorWorkArea, %N%
    return (OutLeft != "" && OutTop != "" && OutRight != "" && OutBottom != "")
}

MouseClick(WhichButton:="Left", X:="", Y:="", ClickCount:="", Speed:="", DU:="", R:="")
{
    MouseClick %WhichButton%, %X%, %Y%, %ClickCount%, %Speed%, %DU%, %R%
}

MouseClickDrag(WhichButton, X1:="", Y1:="", X2:="", Y2:="", Speed:="", R:="")
{
    MouseClickDrag %WhichButton%, %X1%, %Y1%, %X2%, %Y2%, %Speed%, %R%
}

MouseGetPos(ByRef OutputVarX:="", ByRef OutputVarY:="", ByRef OutputVarWin:="", ByRef OutputVarControl:="", Mode:=0)
{
    MouseGetPos OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, %Mode%
}

MouseMove(X, Y, Speed:="", R:="")
{
    MouseMove %X%, %Y%, %Speed%, %R%
}

MsgBox(Params*)
{
    local Len
    if (Len := Params.Length())
    {
        if (Len == 1)
            MsgBox % Params[1]
        else
            MsgBox % Params[1], % Params[2], % Params[3], % Params[4]
    }
    else
        MsgBox
}

OutputDebug(Text)
{
    OutputDebug %Text%
}

Pause(OnOffToggle:="", OperateOnUnderlyingThread:=0)
{
    Pause %OnOffToggle%, %OperateOnUnderlyingThread%
}

PixelGetColor(X, Y, AltSlow:="")
{
    local OutputVar
    PixelGetColor OutputVar, %X%, %Y%, %AltSlow% RGB ; v2 uses RGB
    if !ErrorLevel
        return OutputVar
}

PixelSearch(ByRef OutputVarX:="", ByRef OutputVarY:="", X1:="", Y1:="", X2:="", Y2:="", ColorID:="", Variation:=0, Fast:="")
{
    PixelSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Fast% RGB
    return !ErrorLevel
}

ProcessClose(PIDorName)
{
    Process Close, %PIDorName%
    return ErrorLevel
}

ProcessExist(PIDorName:="")
{
    Process Exist, %PIDorName%
    return ErrorLevel
}

ProcessSetPriority(Priority, PIDorName:="")
{
    Process Priority, %PIDorName%, %Priority%
    return ErrorLevel
}

ProcessWait(PIDorName, SecondsToWait:="")
{
    Process Wait, %PIDorName%, %SecondsToWait%
    return ErrorLevel
}

ProcessWaitClose(PIDorName, SecondsToWait:="")
{
    Process WaitClose, %PIDorName%, %SecondsToWait%
    return ErrorLevel
}

Random(Min:="", Max:="")
{
    local OutputVar
    Random OutputVar, %Min%, %Max%
    return OutputVar
}

RegDelete(RootKeySubKey:="", ValueName:="")
{
    RegDelete %RootKeySubKey%, %ValueName%
    return !ErrorLevel
}

RegRead(RootKeySubKey:="", ValueName:="")
{
    local OutputVar
    RegRead OutputVar, %RootKeySubKey%, %ValueName%
    if !ErrorLevel
        return OutputVar
}

RegWrite(ValueType:="", RootKeySubKey:="", ValueName:="", Value:="")
{
    RegWrite %ValueType%, %RootKeySubKey%, %ValueName%, %Value%
    return !ErrorLevel
}

Reload()
{
    Reload
}

Run(Target, WorkingDir:="", Options:="", ByRef OutputVarPID:="")
{
    Run %Target%, %WorkingDir%, %Options%, OutputVarPID
    if InStr(Options, "UseErrorLevel")
        return !ErrorLevel
}

RunAs(User:="", Password:="", Domain:="")
{
    RunAs %User%, %Password%, %Domain%
}

RunWait(Target, WorkingDir:="", Options:="", ByRef OutputVarPID:="")
{
    RunWait %Target%, %WorkingDir%, %Options%, OutputVarPID
    return ErrorLevel
}

Send(Keys)
{
    Send %Keys%
}

SendEvent(Keys)
{
    SendEvent %keys%
}

SendInput(Keys)
{
    SendInput %Keys%
}

SendLevel(Level)
{
    SendLevel %Level%
}

SendMode(Mode)
{
    SendMode %Mode%
}

SendPlay(Keys)
{
    SendPlay %Keys%
}

SendRaw(Keys)
{
    SendRaw %Keys%
}

SetCapsLockState(State:="")
{
    SetCapsLockState %State%
}

SetControlDelay(Delay)
{
    SetControlDelay %Delay%
}

SetDefaultMouseSpeed(Speed)
{
    SetDefaultMouseSpeed %Speed%
}

SetKeyDelay(Delay:="", PressDuration:="", Play:="")
{
    SetKeyDelay %Delay%, %PressDuration%, %Play%
}

SetMouseDelay(Delay, Play:="")
{
    SetMouseDelay %Delay%, %Play%
}

SetNumLockState(State:="")
{
    SetNumLockState %State%
}

SetRegView(RegView)
{
    SetRegView %RegView%
}

SetScrollLockState(State:="")
{
    SetScrollLockState %State%
}

SetStoreCapslockMode(OnOrOff)
{
    SetStoreCapslockMode %OnOrOff%
}

SetTimer(Label:="", Period:="", Priority:=0)
{
    SetTimer %Label%, %Period%, %Priority%
}

SetTitleMatchMode(MatchModeOrSpeed)
{
    SetTitleMatchMode %MatchModeOrSpeed%
}

SetWinDelay(Delay)
{
    SetWinDelay %Delay%
}

SetWorkingDir(DirName)
{
    SetWorkingDir %DirName%
    return !ErrorLevel
}

Shutdown(Code)
{
    Shutdown %Code%
}

Sleep(DelayInMilliseconds)
{
    Sleep %DelayInMilliseconds%
}

Sort(String, Options:="")
{
    Sort String, %Options%
    return String
}

SoundBeep(Frequency:=523, Duration:=150)
{
    SoundBeep %Frequency%, %Duration%
}

SoundGet(ComponentType:="", ControlType:="", DeviceNumber:=1)
{
    local OutputVar
    SoundGet OutputVar, %ComponentType%, %ControlType%, %DeviceNumber%
    if !ErrorLevel
        return OutputVar
}

SoundPlay(Filename, Wait:="")
{
    SoundPlay %Filenam%, %Wait%
    return !ErrorLevel
}

SoundSet(NewSetting, ComponentType:="", ControlType:="", DeviceNumber:=1)
{
    SoundSet %NewSetting%, %ComponentType%, %ControlType%, %DeviceNumber%
    return !ErrorLevel
}

SplitPath(Path, ByRef OutFileName:="", ByRef OutDir:="", ByRef OutExtension:="", ByRef OutNameNoExt:="", ByRef OutDrive:="")
{
    SplitPath % Path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
}

StatusBarGetText(PartNum:=1, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    StatusBarGetText OutputVar, %PartNum%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if !ErrorLevel
        return OutputVar
}

StatusBarWait(BarText:="", Seconds:="", PartNum:=1, WinTitle:="", WinText:="", Interval:=50, ExcludeTitle:="", ExcludeText:="")
{
    StatusBarWait %BarText%, %Seconds%, %PartNum%, %WinTitle%, %WinText%, %Interval%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

StringCaseSense(OnOffLocale)
{
    StringCaseSense %OnOffLocale%
}

StrLower(String, T:="")
{
    local OutputVar
    StringLower OutputVar, %String%, %T%
    return OutputVar
}

StrUpper(String, T:="")
{
    local OutputVar
    StringUpper OutputVar, %String%, %T%
    return OutputVar
}

Suspend(Mode:="Toggle")
{
    Suspend %Mode%
}

SysGet(SubCommand)
{
    local OutputVar
    SysGet OutputVar, %SubCommand%
    return OutputVar
}

Thread(Param1, Param2:="", Param3:="")
{
    Thread %Param1%, %Param2%, %Param3%
}

ToolTip(Text:="", X:="", Y:="", WhichToolTip:=1)
{
    ToolTip %Text%, %X%, %Y%, %WhichToolTip%
}

TrayTip(Title:="", Text:="", Seconds:="", Options:=0)
{
    TrayTip, %Title%, %Text%, %Seconds%, %Options%
}

Type(Value)
{
    local m, f, e
    if IsObject(Value)
    {
        static nMatchObj  := NumGet(&(m, RegExMatch("", "O)", m)))
        static nBoundFunc := NumGet(&(f := Func("Func").Bind()))
        static nFileObj   := NumGet(&(f := FileOpen("*", "w")))
        static nEnumObj   := NumGet(&(e := ObjNewEnum({})))

        return ObjGetCapacity(Value) != ""  ? "Object"
             : IsFunc(Value)                ? "Func"
             : ComObjType(Value) != ""      ? "ComObject"
             : NumGet(&Value) == nBoundFunc ? "BoundFunc"
             : NumGet(&Value) == nMatchObj  ? "RegExMatchObject"
             : NumGet(&Value) == nFileObj   ? "FileObject"
             : NumGet(&Value) == nEnumObj   ? "Object::Enumerator"
             :                                "Property"
    }
    else if (ObjGetCapacity([Value]) != "")
        return "String"
    else
        return InStr(Value, ".") ? "Float" : "Integer"
}

WinActivate(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinActivate %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinActivateBottom(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinActivateBottom %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinClose(WinTitle:="", WinText:="", SecondsToWait:="", ExcludeTitle:="", ExcludeText:="")
{
    WinClose %WinTitle%, %WinText%, %SecondsToWait%, %ExcludeTitle%, %ExcludeText%
}

WinGetClass(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGetClass OutputVar, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetControls(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, ControlList, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return StrSplit(OutputVar, "`n")
}

WinGetControlsHwnd(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar, ControlsHwnd, i
    WinGet OutputVar, ControlListHwnd, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    ControlsHwnd := StrSplit(OutputVar, "`n")
    for i in ControlsHwnd
        ControlsHwnd[i] += 0
    return ControlsHwnd
}

WinGetCount(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, Count, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetExStyle(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, ExStyle, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar + 0
}

WinGetID(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, ID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar + 0
}

WinGetIDLast(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, IDLast, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar + 0
}

WinGetList(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar, List
    WinGet OutputVar, List, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    List := []
    Loop % OutputVar
        List.Push(OutputVar%A_Index% + 0)
    return List
}

WinGetMinMax(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, MinMax, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetPID(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, PID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetPos(ByRef X:="", ByRef Y:="", ByRef Width:="", ByRef Height:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinGetPos, X, Y, Width, Height, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinGetProcessName(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, ProcessName, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetProcessPath(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, ProcessPath, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetStyle(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, Style, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar + 0
}

WinGetText(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGetText OutputVar, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if !ErrorLevel
        return OutputVar
}

WinGetTitle(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGetTitle OutputVar, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetTransColor(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, TransColor, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinGetTransparent(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local OutputVar
    WinGet OutputVar, Transparent, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return OutputVar
}

WinHide(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinHide %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinKill(WinTitle:="", WinText:="", SecondsToWait:="", ExcludeTitle:="", ExcludeText:="")
{
    WinKill %WinTitle%, %WinText%, %SecondsToWait%, %ExcludeTitle%, %ExcludeText%
}

WinMaximize(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinMaximize %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinMinimize(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinMinimize %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinMinimizeAll()
{
    WinMinimizeAll
}

WinMinimizeAllUndo()
{
    WinMinimizeAllUndo
}

WinMove(Params*)
{
    local WinTitle, WinText, X, Y, Width, Height, ExcludeTitle, ExcludeText
    local Len
    if (Len := Params.Length())
    {
        if (Len > 2)
        {
            WinTitle     := Params[1]
            WinText      := Params[2]
            X            := Params[3]
            Y            := Params[4]
            Width        := Params[5]
            Height       := Params[6]
            ExcludeTitle := Params[7]
            ExcludeText  := Params[8]
            WinMove %WinTitle%, %WinText%, %X%, %Y%, %Width%, %Height%, %ExcludeTitle%, %ExcludeText%
        }
        else
        {
            X := Params[1]
            Y := Params[2]
            WinMove %X%, %y%
        }
    }
    else
        WinMove
}

WinMoveBottom(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinSet Bottom,, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinMoveTop(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinSet Top,, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinRedraw(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinSet Redraw,, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinRestore(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinRestore %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinSetAlwaysOnTop(OnOffToggle:="Toggle", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local Hwnd
    WinGet Hwnd, ID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if (!Hwnd)
        return 0

    if OnOffToggle in 1,0,-1 ; On,Off,Toggle
        OnOffToggle := OnOffToggle == -1 ? "Toggle" : OnOffToggle ? "On" : "Off"

    if OnOffToggle not in On,Off,Toggle
        throw Exception("Parameter #1 invalid.", -1) ; v2 raises an error

    WinSet AlwaysOnTop, %OnOffToggle%, ahk_id %Hwnd%
    return 1
}

WinSetEnabled(Value, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local Hwnd
    WinGet Hwnd, ID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if (!Hwnd)
        return 0

    ; 1, 0 and -1 are compared as strings, non-integer values(e.g.: 1.0) are not allowed
    local Style
    if (Value = "Toggle" || value == "-1")
    {
        WinGet Style, Style, ahk_id %Hwnd%
        Value := (Style & 0x8000000) ? "On" : "Off" ; WS_DISABLED = 0x8000000
    }

    if (Value = "On" || Value == "1")
        WinSet Enable,, ahk_id %Hwnd%
    else if (Value = "Off" || Value == "0")
        WinSet Disable,, ahk_id %Hwnd%
    else
        throw Exception("Paramter #1 invalid.", -1) ; v2 raises an error
    return 1
}

WinSetExStyle(N, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinSet ExStyle, %N%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

WinSetRegion(Options:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinSet Region, %Options%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

WinSetStyle(N, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinSet Style, %N%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

WinSetTitle(Param:="", Params*)
{
    local WinTitle, WinText, NewTitle, ExcludeTitle, ExcludeText
    if (Params.Length())
    {
        WinTitle     := Param
        WinText      := Params[1]
        NewTitle     := Params[2]
        ExcludeTitle := Params[3]
        ExcludeText  := Params[4]
        WinSetTitle %WinTitle%, %WinText%, %NewTitle%, %ExcludeTitle%, %ExcludeText%
    }
    else
        WinSetTitle %Param% ; WinSetTitle, NewTitle
}

WinSetTransColor(ColorN, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local Hwnd
    WinGet Hwnd, ID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if (!Hwnd)
        return 0

    WinSet TransColor, %ColorN%, ahk_id %Hwnd%
    return 1
}

WinSetTransparent(N, WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    local Hwnd
    WinGet Hwnd, ID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if (!Hwnd)
        return 0

    WinSet Transparent, %N%, ahk_id %Hwnd%
    return 1
}

WinShow(WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="")
{
    WinShow %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
}

WinWait(WinTitle:="", WinText:="", Seconds:="", ExcludeTitle:="", ExcludeText:="")
{
    WinWait %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

WinWaitActive(WinTitle:="", WinText:="", Seconds:="", ExcludeTitle:="", ExcludeText:="")
{
    WinWaitActive %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

WinWaitClose(WinTitle:="", WinText:="", Seconds:="", ExcludeTitle:="", ExcludeText:="")
{
    WinWaitClose %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

WinWaitNotActive(WinTitle:="", WinText:="", Seconds:="", ExcludeTitle:="", ExcludeText:="")
{
    WinWaitNotActive %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
    return !ErrorLevel
}

