# List 10 recent files in current directory
def lm [dir: path = .] {
    ls $dir | sort-by modified | where type == file | last 10
}
# Same as lm, but show hidden files too
def lma [dir: path = .] {
    ls -a $dir | sort-by modified | where type == file | last 10
}

