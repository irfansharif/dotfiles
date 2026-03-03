function fullpath --description "Print the full path of a file"
    if test (count $argv) -eq 0
        echo "Usage: fullpath <file>" >&2
        return 1
    end

    for file in $argv
        if test -e $file
            realpath $file
        else
            echo "fullpath: $file: No such file or directory" >&2
            return 1
        end
    end
end
