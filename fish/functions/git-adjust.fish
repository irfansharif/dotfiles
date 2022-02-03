function git-adjust
  env GIT_COMMITTER_DATE=(date -v$argv) git commit --amend --no-edit --date (date -v$argv)
end
