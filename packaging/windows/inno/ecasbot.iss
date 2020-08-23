﻿; EC AntiSpam bot for the Telegram messenger
; Copyright (c) 2017 - 2020 EasyCoding Team
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program. If not, see <http://www.gnu.org/licenses/>.

#define VERSION GetFileVersion("..\results\dist\ecasbot.exe")
#define BASEDIR "..\results\dist"
#define CI_COMMIT GetEnv('CI_HASH')
#if CI_COMMIT == ''
#define _RELEASE 1
#endif

[Setup]
AppId={{67B50FB5-DEAE-4933-A1DE-4946879B879F}
AppName=EC AntiSpam bot
AppVerName=EC AntiSpam bot
AppPublisher=EasyCoding Team
AppPublisherURL=https://www.easycoding.org/
AppVersion={#VERSION}
AppSupportURL=https://github.com/xvitaly/ecasbot/issues
AppUpdatesURL=https://github.com/xvitaly/ecasbot/releases
DefaultDirName={code:GetDefRoot}\ecasbot
DefaultGroupName=EC AntiSpam bot
AllowNoIcons=yes
LicenseFile=..\..\..\LICENSE
OutputDir=..\results
#ifdef _RELEASE
OutputBaseFilename=ecasbot_{#GetEnv('RELVER')}
#else
OutputBaseFilename=snapshot_{#CI_COMMIT}
#endif
SetupIconFile=..\assets\ecasbot.ico
UninstallDisplayIcon={app}\ecasbot.exe
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
ShowLanguageDialog=auto
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
MinVersion=6.1.7601
VersionInfoVersion={#VERSION}
VersionInfoDescription=EC AntiSpam bot
VersionInfoCopyright=(c) 2005-2020 EasyCoding Team. All rights reserved.
VersionInfoCompany=EasyCoding Team

[Messages]
BeveledLabel=EasyCoding Team

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; InfoBeforeFile: "locale\en\readme.txt"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"; InfoBeforeFile: "locale\ru\readme.txt"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#BASEDIR}\ecasbot.exe"; DestDir: "{app}"; Flags: ignoreversion

#ifdef _RELEASE
Source: "{#BASEDIR}\ecasbot.exe.sig"; DestDir: "{app}"; Flags: ignoreversion
#endif

[Icons]
Name: "{group}\EC AntiSpam bot"; Filename: "{app}\ecasbot.exe"
Name: "{group}\{cm:ProgramOnTheWeb,EC AntiSpam bot}"; Filename: "https://github.com/xvitaly/ecasbot"
Name: "{userdesktop}\EC AntiSpam bot"; Filename: "{app}\ecasbot.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\EC AntiSpam bot"; Filename: "{app}\ecasbot.exe"; Tasks: quicklaunchicon

[Code]
function GetDefRoot(Param: String): String;
begin
  if not IsAdmin then
    Result := ExpandConstant('{localappdata}')
  else
    Result := ExpandConstant('{pf}')
end;