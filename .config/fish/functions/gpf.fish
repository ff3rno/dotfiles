function gpf --description "Force push current branch to its remote"
    set -l current_branch (git rev-parse --abbrev-ref HEAD)

    if test $status -ne 0
        echo "Error: Not in a git repository"
        return 1
    end

    echo "Force pushing $current_branch..."
    gp --force

    if test $status -ne 0
        return 1
    end
end 