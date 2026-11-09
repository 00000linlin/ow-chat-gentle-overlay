#define AppName "OW Chat Gentle Overlay"
#define AppVersion "0.1.0"
#define AppExeName "OW-Chat-Gentle-Overlay.exe"

[Setup]
AppId={{84F6918C-0AFA-4A3C-969A-5C5E9A870440}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
DefaultDirName={localappdata}\Programs\OW Chat Gentle Overlay
DefaultGroupName={#AppName}
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputDir=dist
OutputBaseFilename=OW-Chat-Gentle-Overlay-Setup-{#AppVersion}
SetupIconFile=img\icon.ico
UninstallDisplayIcon={app}\{#AppExeName}
LicenseFile=LICENSE
InfoBeforeFile=THIRD_PARTY_NOTICES.md
WizardStyle=modern
Compression=lzma2/ultra64
SolidCompression=yes
VersionInfoVersion=0.1.0.0
VersionInfoProductName={#AppName}
VersionInfoProductVersion={#AppVersion}
VersionInfoDescription=DeepSeek-powered Overwatch chat rewrite overlay

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional shortcuts:"; Flags: unchecked

[Files]
Source: "dist\{#AppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: ".env.example"; DestDir: "{app}"; DestName: ".env"; Flags: onlyifdoesntexist
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "THIRD_PARTY_NOTICES.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#AppName}"; Filename: "{app}\{#AppExeName}"; WorkingDir: "{app}"
Name: "{autoprograms}\{#AppName}\Configure DeepSeek API Key"; Filename: "{sys}\notepad.exe"; Parameters: """{app}\.env"""
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; WorkingDir: "{app}"; Tasks: desktopicon
