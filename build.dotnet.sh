#!/bin/bash

CONFIGPATH=./config
OPNSIMPATH=../bin

echo "==================="
echo "DTL/NSL_CURRENCY"
echo "==================="

./clean.sh
./runprebuild.dotnet.sh
dotnet build -c Release OpenSim.Currency.sln || exit 1

echo
cp -f bin/net6.0/OpenSim.Data.MySQL.MySQLMoneyDataWrapper.dll $OPNSIMPATH
cp -f bin/net6.0/OpenSim.Modules.Currency.dll $OPNSIMPATH
cp -f bin/net6.0/MoneyServer.dll $OPNSIMPATH
cp -f bin/net6.0/MoneyServer $OPNSIMPATH


rm -f $OPNSIMPATH/OpenSim.Forge.Currency.dll

if [ ! -f $OPNSIMPATH/MoneyServer.ini ]; then
	cp $CONFIGPATH/MoneyServer.ini $OPNSIMPATH
else
	cp $CONFIGPATH/MoneyServer.ini $OPNSIMPATH/MoneyServer.ini.example
fi

if [ ! -f $OPNSIMPATH/MoneyServer.exe.config ]; then
	cp $CONFIGPATH/MoneyServer.exe.config $OPNSIMPATH
fi

# Sample Server Cert file 1 for MoneyServer.exe
if [ ! -f $OPNSIMPATH/SineWaveCert.pfx ]; then
	cp $CONFIGPATH/SineWaveCert.pfx $OPNSIMPATH
fi

# Sample Server Cert file 2 (JOGRID.NET) for MoneyServer.exe. No password
if [ ! -f $OPNSIMPATH/server_cert.p12 ]; then
	cp $CONFIGPATH/server_cert.p12 $OPNSIMPATH
fi


