#!/bin/bash
#
echo y | dotnet ../bin/prebuild.dll /file prebuild.net.xml /clean

dotnet ../bin/prebuild.dll /target vs2022 /targetframework net8_0 /excludedir = "obj | bin" /file prebuild.net.xml

