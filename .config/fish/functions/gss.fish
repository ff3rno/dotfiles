function gss --description "Git status with detailed formatting"
    set -l git_status_result (git status --porcelain=v2 2>/dev/null)
    
    if test $status -ne 0
        echo "Not a git repository"
        return 1
    end
    
    set -l branch (git branch --show-current)
    set -l remote_branch (git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
    
    if test $status -ne 0
        set remote_branch "no upstream"
    end
    
    echo "On branch: "(set_color green)$branch(set_color normal)" → "(set_color blue)$remote_branch(set_color normal)
    
    set -l ahead_behind (git rev-list --count --left-right @{u}...HEAD 2>/dev/null)
    
    if test $status -eq 0
        set -l ahead (echo $ahead_behind | awk '{print $2}')
        set -l behind (echo $ahead_behind | awk '{print $1}')
        
        if test $ahead -gt 0
            echo (set_color yellow)"Ahead by $ahead commit(s)"(set_color normal)
        end
        
        if test $behind -gt 0
            echo (set_color red)"Behind by $behind commit(s)"(set_color normal)
        end
    end
    
    if test -z "$git_status_result"
        echo (set_color green)"Working tree clean"(set_color normal)
        return 0
    end
    
    echo ""
    git status -s | while read -l line
        set -l file_status (string sub -l 2 $line)
        set -l file (string sub -s 4 $line)
        
        switch $file_status
            case 'M*'
                echo (set_color green)"M"(set_color normal)" $file"
            case '*M'
                echo (set_color red)"M"(set_color normal)" $file"
            case 'A*'
                echo (set_color green)"A"(set_color normal)" $file"
            case '*A'
                echo (set_color red)"A"(set_color normal)" $file"
            case 'D*'
                echo (set_color green)"D"(set_color normal)" $file"
            case '*D'
                echo (set_color red)"D"(set_color normal)" $file"
            case '??'
                echo (set_color cyan)"?"(set_color normal)" $file"
            case '*'
                echo (set_color yellow)"$file_status"(set_color normal)" $file"
        end
    end
end 