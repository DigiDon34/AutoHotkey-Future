IniWrite(Value, Filename, Section, Key:="")
{
    IniWrite %Value%, %Filename%, %Section%, %Key%
    return !ErrorLevel
}