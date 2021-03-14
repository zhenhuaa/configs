# alias
abbr -a e nvim
abbr -a g git
abbr -a gco 'git checkout'
abbr -a gco 'git checkout'
abbr -a gcm 'git commit -m'
abbr -a ga 'git add'
abbr -a gst 'git status'
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gp 'git push'
abbr -a gdh 'git diff HEAD'
abbr -a nvm fnm
alias glog "git  log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias tb="nc termbin.com 9999"
abbr -a j z
abbr -a gig "git rm -r --cached . && git add ."
alias nenpm='cnpm --registry=http://rnpm.hz.netease.com/ --registryweb=http://npm.hz.netease.com/ --cache=$HOME/.nenpm/.cache --userconfig=$HOME/.nenpmrc'


if command -v exa > /dev/null
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end


# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin ~/.local/bin ~/go/bin ~/.poetry/bin ~/.cargo/bin  /home/linuxbrew/.linuxbrew/bin

# Type - to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

function fish_greeting
end


setenv LC_ALL "en_US.UTF-8"

fnm env | source
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
