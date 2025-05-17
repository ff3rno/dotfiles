function gf --description "Fetch a specific branch from remote"
    if test (count $argv) -ne 1
        echo "Usage: gf branch"
        echo "Fetches the specified branch from remote"
        return 1
    end

    set -l branch $argv[1]

    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    set -l current_branch (git rev-parse --abbrev-ref HEAD)
    set -l remote_name (git config --get branch.$current_branch.remote)

    if test -z "$remote_name"
        set remote_name "origin"
    end

    echo "Fetching $branch from $remote_name..."
    git fetch $remote_name $branch:$branch

    if test $status -eq 0
        echo "Successfully fetched $branch from $remote_name"
    else
        echo "Failed to fetch $branch from $remote_name"
        return 1
    end
end 