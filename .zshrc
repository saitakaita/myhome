umask 002
cdpath=(~)

setopt AUTOPUSHD
setopt PUSHD_IGNORE_DUPS
setopt AUTO_CD
setopt CDABLEVARS

#typeset -ga chpwd_functions
#typeset -ga preexec_functions

for file in bindkey prompt complete history screen alias individual_alias zaw; do
  [ -f ~/.zsh/$file.zsh ]; source ~/.zsh/$file.zsh
done

function chpwd () {
    _reg_pwd_screennum
    _prompt_compute_vars
    _color_ls
}

function preexec () {
    _set_screen_tabline $1 $2
    _git_preexec_update_vars
}

