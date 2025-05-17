if status is-interactive
    # Interactive session configuration is handled in conf.d/ and functions/
end

# Configuration files in conf.d/ are automatically loaded
# Function files in functions/ are automatically loaded

if test -f /Users/f3rno/.autojump/share/autojump/autojump.fish;
    source /Users/f3rno/.autojump/share/autojump/autojump.fish;
end

source "$HOME/.cargo/env.fish"