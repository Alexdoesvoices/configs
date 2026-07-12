function openZED-openPNPMdev {
    zed .
    pnpm run dev --open
}
Set-Alias zpdo openZED-openPNPMdev


function chezmoi-all-in-one {
    # -join ' ' takes all arguments passed to the function and merges them into one string
    $message = $args -join ' '

    if (-not $message) { $message = "Update dotfiles" }

    chezmoi re-add
    chezmoi git -- add .
    chezmoi git -- commit -m "$message"
    chezmoi git -- push
}
Set-Alias cm-push chezmoi-all-in-one

# Chezmoi shortcut!
function cm {
    chezmoi @args
}
