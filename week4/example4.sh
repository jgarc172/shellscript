#! /bin/sh
# date -> Mon Jan 25 12:23:11 PST 2010 -> 01/25/2010
# date -> $1  $2  $3 $4       $5  $6   -> $(mon $2)/$3/$6
#
mon() {
    local month
    case "$1" in
        [Jj]an) mon=01;;
        [Ff]eb) mon=02;;
        [Mm]ar) mon=03;;
        [Aa]pr) mon=04;;
        [Mm]ay) mon=05;;
        [Jj]un) mon=06;;
        [Jj]ul) mon=07;;
        [Aa]ug) mon=08;;
        [Ss]ep) mon=09;;
        [Oo]ct) mon=10;;
        [Nn]ov) mon=11;;
        [Dd]ec) mon=12;;
        *) echo "something is wrong. Month = '$1'"; exit 1;;
    esac
    echo $mon
}
set -- $(date)
echo "$(mon $2)/${3}/$6"
