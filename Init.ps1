
# Magic C++ stuff
Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class ForwardWindow {
            [DllImport("user32.dll")]
            public static extern bool SetForegroundWindow(IntPtr hWnd);
            [DllImport("kernel32.dll")]
            public static extern IntPtr GetConsoleWindow();
        }
"@ 

function Get-ToolsVersion {
    $version_file = Join-Path -Path "$PSScriptRoot\..\ToolAddons" -ChildPath "VERSION"

    if (-Not (Test-Path -Path $version_file)) {
        return "0.0.0"
    }

    return Get-Content $version_file
}

# Downloads tools from website, returns where it downloaded to your PC
function Download-Tools {
    param (
        [Version]$Version
    )

    $url = "https://dab.dev/template/packages/ModTemplate-$Version.zip"
    $destination = Join-Path -Path $env:TEMP -ChildPath "ModTemplate-$Version.zip"
    if (Test-Path -Path $destination) {
        Write-Host "File $destination already exists, skipping..."
        return $destination
    }

    Write-Host "Downloading file '$url'"
    Invoke-WebRequest -Uri $url -OutFile $destination
    return $destination
}

function Get-RepositoryRoot {
    return (Get-Item $PSScriptRoot).parent.parent.parent.FullName;
}

function Get-ModPrefix {
    return (Get-Item $PSScriptRoot).parent.parent.Name;
}

function Get-Workdrive {
    $workdrive = "P:\"

    while (-Not (Test-Path -Path $workdrive)) {
        # Get workdrive
        [void] [ForwardWindow]::SetForegroundWindow([ForwardWindow]::GetConsoleWindow())

        Add-Type -AssemblyName System.Windows.Forms
        $file_browser = New-Object System.Windows.Forms.FolderBrowserDialog
        $file_browser.Description = "Select A Folder"
        $file_browser.SelectedPath = $workdrive

        if ($file_browser.ShowDialog() -eq "OK") {
            Write-Host $file_browser.SelectedPath
        }
    }

    return $workdrive
}

### END COMMON, START SCRIPT

# Get user input
$prefix = Read-Host -Prompt 'Enter your mod prefix (ModName)'
$prefix = $prefix.Replace(" ", "")
$prefix = $prefix.Replace("\t", "")
$prefix = $prefix.Replace("\n", "")
if ("" -eq $prefix) {
    $prefix = "ModName"
}

$current_item = Get-Item .
$name = $current_item.Name
$target_directory = $current_item.FullName

if ("DayZ-Mod-Template" -eq $name) {
    Write-Error "Invalid Mod Name ($name)"
    Read-Host "Press Enter to exit..."
    return
}

# Create script folders
New-Item -Path (Join-Path $current_item.FullName "ModTemplate\Scripts\1_Core\$prefix") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "ModTemplate\Scripts\3_Game\$prefix") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "ModTemplate\Scripts\4_World\$prefix") -ItemType Directory
New-Item -Path (Join-Path $current_item.FullName "ModTemplate\Scripts\5_Mission\$prefix") -ItemType Directory

# Rename all ModTemplate folders
foreach ($folder in Get-ChildItem -Directory $target_directory -Recurse) {
    if ($folder.Name.Contains("ModTemplate")) {
        $new_name = $folder.FullName.Replace("ModTemplate", $prefix)
        Rename-Item -Path $folder.FullName -NewName $new_name
    }
}