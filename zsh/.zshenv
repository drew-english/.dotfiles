# Aliases
# git
alias gst='git status'
alias gdf='git diff'
alias gpr='git pull --rebase --autostash --stat'
alias gpo='unset PUSH_ANYWAY; git push origin HEAD'
alias gpro='gpr;gpo'
alias ga='git add .'
alias gcb='git co -b'
alias gp='git pair'
alias gcm='git co $(git_main_branch)'
alias gc='git co'
alias gss='git stash'
alias gsp='git stash pop'
alias grhh='git reset --hard HEAD'
alias grsh='git reset --soft HEAD^'
alias gl='git log'
alias grl='git reflog'
alias gmm='git merge master'
alias gmom='git merge origin/master'
alias gri='git rebase -i'
alias gcp='git cherry-pick'
alias gca='git add . && git commit --amend --no-edit'
alias gcmm='git commit -m'
alias fbr='git checkout $(git branch --all | grep -v HEAD | fzf | sed "s/.* //" | sed "s#remotes/[^/]*/##")'
alias fcs='git log --color=always --pretty=oneline --abbrev-commit --reverse | fzf --ansi --tac +s +m | sed "s/ .*//"'
alias gbh='git checkout $(git reflog --grep-reflog "checkout" --pretty=format:%gs | grep -o "to .*$" | grep -o " .*$" | awk "!seen[\$0]++" | sed -e "s/\s//" | fzf)'

# Rails
alias rc='bundle exec rails console'
alias rs='bundle exec rails server'
alias rspec='bundle exec rspec'
alias rdm='bundle exec rake db:migrate'
alias rdr='bundle exec rake db:reset'
alias rds='bundle exec rake db:seed'

# Terraform
alias tf='terraform'
alias tg='terragrunt'
alias tgra='terragrunt run-all'

# AWS
alias pieslogin='aws ssm start-session --target $(aws ec2 --no-paginate describe-instances --filter "Name=tag:FormationStack,Values=Pie1Gemini" | jq "[.Reservations[].Instances[].Tags[]] | map(select(.Key == \"Name\" and (.Value | test(\"GeminiUnicorn\")))) | [.[].Value][0]" | sed -e "s/\"//g" | sed -e "s/.*\(i-.*\)/\1/")'
