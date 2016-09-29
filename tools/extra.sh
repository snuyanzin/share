# Extra code style checking.
case $(pwd) in
(*/hive/*) exit;;
esac
git diff |
awk '
/^diff / {f=$3}
/^\+/ && !/^\+\+\+/ && f ~ /.java/ && length($0) > 81 {print f " line too long"; print}
    '
exec find $(find . -name src -type d) -type f ! -name \*~ | xargs awk -f $(dirname $0)/extra.awk
