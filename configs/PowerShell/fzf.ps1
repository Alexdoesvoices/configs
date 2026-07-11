$env:FZF_DEFAULT_OPTS = @"
"--color=fg:#cdd6f4,bg:#1e1e2e,hl:#f38ba8,fg+:#cdd6f4,bg+:#313244"
"--color=hl+:#f38ba8,info:#cba6f7,prompt:#cba6f7,pointer:#f5e0dc"
"--color=marker:#f8ebe8,spinner:#f5e0dc,header:#f38ba8,border:#585b70"
"--color=gutter:#313244"
--layout=reverse
--height=100%
--no-border
--prompt="> "
--preview-window="right,65%,border-left"
--preview="cmd /c if exist {} (type {})"
--color="fg+:12,bg+:-1,hl:4,hl+:12,pointer:12,prompt:4,info:8,spinner:4"
"@
