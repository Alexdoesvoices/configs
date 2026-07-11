function yt-dlp-mass-download
{
    param(
        [Parameter(Mandatory=$true)][string]$file,
        [Parameter(Mandatory=$false)][string]$name, # Made optional
        [nullable[int]]$start = $null
    )

    # Common yt-dlp arguments base
    $ytArgs = @(
        '--user-agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
        '--extractor-args', 'generic:impersonate;chrome',
        '--add-header', 'Origin:https://megacloud.blog',
        '--add-header', 'Referer:https://megacloud.blog/',
        '-f', 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best',
        '--no-check-certificate',
        '--js-runtimes', 'node',
        '--merge-output-format', 'mp4',
        '--no-part',
        '--fixup', 'force',
        '--windows-filenames',
        '-a', $file
    )

    # 1. Logic IF a custom name is provided
    if (-not [string]::IsNullOrEmpty($name))
    {
        $startNum = $start
        if ($null -eq $startNum)
        {
            $existingFiles = Get-ChildItem -Filter "$name - *.mp4" |
                ForEach-Object { 
                    if ($_.Name -match "$name - (\d+)") { [int]$matches[1] } 
                } | Sort-Object -Descending

            $startNum = if ($existingFiles) { $existingFiles[0] + 1 } else { 1 }
            Write-Host "--- Auto-detected start: $startNum ---" -ForegroundColor Cyan
        }

        # Append custom naming arguments
        $ytArgs += '--autonumber-start', $startNum
        $ytArgs += '-o', "$name - %(autonumber)02d.%(ext)s"
    }
    # 2. Logic IF NO name is provided (fallback to video title)
    else 
    {
        Write-Host "--- No custom name provided. Using video titles. ---" -ForegroundColor Yellow
        $ytArgs += '-o', "%(title)s.%(ext)s"
    }

    # Execute yt-dlp with the dynamically built arguments
    yt-dlp @ytArgs
}

Set-Alias yt-dlp-md yt-dlp-mass-download



function yt-dlp-music-download
{
    param(
        [Parameter(Mandatory=$true)][string]$file,
        [Parameter(Mandatory=$true)][string]$name,
        [nullable[int]]$start = $null
    )

    # 1. Smart Numbering Logic
    $startNum = $start
    if ($null -eq $startNum)
    {
        $existingFiles = Get-ChildItem -Filter "$name - *.mp4" |
            ForEach-Object { if ($_.Name -match "$name - (\d+)")
                { [int]$matches[1] 
                } } |
            Sort-Object -Descending
        $startNum = if ($existingFiles)
        { $existingFiles[0] + 1 
        } else
        { 1 
        }
        Write-Host "--- Auto-detected start: $startNum ---" -ForegroundColor Cyan
    }

    yt-dlp `
        --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36" `
        --extractor-args "generic:impersonate;chrome" `
        --add-header "Origin:https://megacloud.blog" `
        --add-header "Referer:https://megacloud.blog/" `
        -f "ba/ba*" `
        --extract-audio `
        --audio-format mp3 `
        --audio-quality 0 `
        --no-check-certificate `
        --js-runtimes node `
        --no-part `
        --fixup force `
        --windows-filenames `
        -a $file `
        --autonumber-start $startNum `
        -o "$name - %(autonumber)02d.%(ext)s"
}

Set-Alias yt-dlp-music yt-dlp-music-download
