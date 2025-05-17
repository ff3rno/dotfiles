function gp --description "Push current branch to its remote"
    set -l current_branch (git rev-parse --abbrev-ref HEAD)

    if test $status -ne 0
        echo "Error: Not in a git repository"
        return 1
    end

    set -l remote_name (git config --get branch.$current_branch.remote)

    if test -z "$remote_name"
        set remote_name "origin"
    end

    echo "Pushing $current_branch to $remote_name..."
    git push $remote_name $current_branch $argv

    if test $status -eq 0
        echo "Successfully pushed $current_branch to $remote_name"
    else
        echo "Failed to push $current_branch to $remote_name"
        return 1
    end
end 