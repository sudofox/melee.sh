# sudofox/melee.sh

# warn if ffplay is not installed
if ! type ffplay >/dev/null 2>&1; then
    >&2 echo "melee.sh: ffplay is not installed"
fi

melee() {
    MELEE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    success() {
        ( ffplay -loglevel error -nodisp -autoexit $MELEE_DIR/sounds/success.mp3 > /dev/null 2>&1 & disown)
        return 0
    }
    failure() {
        local rc=$?
        ( ffplay -loglevel error -nodisp -autoexit $MELEE_DIR/sounds/failure.mp3 > /dev/null 2>&1 & disown)
        return $rc
    }
    # eval is used here to allow for alias resolution
    eval "$@" && success || failure
    return $?
}