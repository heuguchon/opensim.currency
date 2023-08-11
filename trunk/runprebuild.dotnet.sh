#mono ../bin/Prebuild.exe /target vs2008 /targetframework v3_5 /conditionals NET_3_5
#mono ../bin/Prebuild.exe /target vs2010
#mono ../bin/Prebuild.exe /target vs2015

dotnet ../bin/prebuild.dll /target vs2022 /targetframework net6_0 /excludedir = "obj | bin" /file prebuild.dotnet.xml

