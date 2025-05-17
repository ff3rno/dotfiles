function gc --description "Clone a GitHub repo to ~/.src/github/user/repo and cd into it"
    if test (count $argv) -ne 1
        echo "Error: Please provide exactly one argument in the format 'user/repo'"
        return 1
    end

    set -l repo_path $argv[1]

    if not string match -q -r '^[^/]+/[^/]+$' $repo_path
        echo "Error: Invalid format. Please use 'user/repo'"
        return 1
    end

    set -l user (string split '/' $repo_path)[1]
    set -l repo (string split '/' $repo_path)[2]

    set -l target_dir $HOME/.src/github/$user/$repo
    mkdir -p (dirname $target_dir)

    git clone https://github.com/$user/$repo.git $target_dir

    if test $status -eq 0
        cd $target_dir
        echo "Successfully cloned https://github.com/$user/$repo.git to $target_dir"
    else
        echo "Error: Failed to clone https://github.com/$user/$repo.git"
        return 1
    end
end 