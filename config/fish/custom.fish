[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set --export PATH /usr/local/opt/ruby/bin $PATH
set --export PATH /Users/irfansharif/.cargo/bin $PATH
set --export PATH /usr/local/opt/ccache/libexec $PATH

set --export PATH $PATH /usr/local/lib/ruby/gems/2.6.0/bin
set --export PATH $PATH /Users/irfansharif/Downloads/upspin
set --export PATH $PATH /Library/TeX/texbin
set --export PATH $PATH /Library/TeX/texbin
set --export PATH $PATH /Users/irfansharif/Software/src/github.com/cockroachdb/cockroach/bin
set --export PATH $PATH /Users/irfansharif/Library/Python/3.7/bin

set --export COCKROACH_DEV_LICENSE crl-0-EJL04ukFGAEiI0NvY2tyb2FjaCBMYWJzIC0gUHJvZHVjdGlvbiBUZXN0aW5n

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/irfansharif/Work/google-cloud-sdk/path.fish.inc' ]; . '/Users/irfansharif/Work/google-cloud-sdk/path.fish.inc'; end

direnv hook fish | source
