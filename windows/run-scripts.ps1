<#
.SYNOPSIS
    Runs all PowerShell scripts in a specified directory, optionally filtered, with a dry run feature.

.DESCRIPTION
    This script searches for .ps1 scripts directly under the specified 'scripts' directory,
    filters by an optional filter string in the file name, and executes them sequentially in isolated PowerShell processes.
    Supports dry-run mode to preview execution commands without running them.
    Displays a help message with usage instructions.

.PARAMETER Dry
    Switch. Enable dry-run mode (only show scripts that would be executed).

.PARAMETER ScriptsDir
    Path to the directory containing scripts to run. Defaults to 'scripts' folder next to this script.

.PARAMETER Filter
    Optional substring filter to run only scripts whose name contains this string.

.EXAMPLE
    .\Run-Scripts.ps1 -Dry -Filter build

    Shows the scripts containing "build" that would be executed without running them.

#>

[CmdletBinding()]
param (
    [switch]$Dry,

    [string]$ScriptsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\scripts",

    [string]$Filter = ""
)

function Show-Usage {
    $scriptName = Split-Path -Leaf $MyInvocation.MyCommand.Name
    Write-Host @"
Usage: $scriptName [-Dry] [-ScriptsDir <path>] [-Filter <string>] [-Help]

Parameters:
  -Dry           : Enable dry run mode (show scripts without executing)
  -ScriptsDir    : Path to scripts directory (default: 'scripts' folder next to this script)
  -Filter        : Only run scripts containing this filter string in the filename
  -Help          : Show this usage message
"@
}

if ($PSBoundParameters.ContainsKey('Help')) {
    Show-Usage
    exit 0
}

# Validate scripts directory exists
if (-not (Test-Path -Path $ScriptsDir -PathType Container)) {
    Write-Error "Scripts directory '$ScriptsDir' does not exist."
    exit 1
}

Write-Host "Starting script runner"

Write-Host "Filter: '$Filter'"
Write-Host ""

# Get all .ps1 scripts (exactly 1 level deep; no recursion)
$scripts = Get-ChildItem -Path $ScriptsDir -Filter "*.ps1" -File -Depth 1 | Sort-Object Name

# Filter scripts if filter specified
if ($Filter -ne "") {
    $filteredScripts = $scripts | Where-Object { $_.Name -like "*$Filter*" }
    $skippedScripts = $scripts | Where-Object { $_.Name -notlike "*$Filter*" }
    foreach ($skip in $skippedScripts) {
        Write-Host "Skipping (filter '$Filter' not in filename): $($skip.Name)"
    }
    $scripts = $filteredScripts
}

if ($scripts.Count -eq 0) {
    Write-Warning "No matching scripts found."
    exit 0
}

foreach ($script in $scripts) {
    $fullPath = $script.FullName

    if ($Dry) {
        Write-Host "[DRY RUN]: Would execute - $fullPath"
        continue
    }

    Write-Host "Executing script: $fullPath"
    try {
        # Run each .ps1 script in an independent PowerShell process
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = "powershell.exe"
        $psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$fullPath`""
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true
        $psi.UseShellExecute = $false
        $psi.CreateNoWindow = $true

        $proc = [System.Diagnostics.Process]::Start($psi)

        $stdout = $proc.StandardOutput.ReadToEnd()
        $stderr = $proc.StandardError.ReadToEnd()

        $proc.WaitForExit()

        if ($stdout) {
            Write-Host $stdout
        }
        if ($stderr) {
            Write-Warning $stderr
        }

        if ($proc.ExitCode -ne 0) {
            Write-Warning "Script '$($script.Name)' exited with code $($proc.ExitCode)"
        }
    }
    catch {
        Write-Warning "Failed to execute script '$($script.Name)': $_"
    }
}

Write-Host "All done."