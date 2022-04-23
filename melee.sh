#!/usr/bin/env bash
# sudofox/melee.sh

melee() {
    MELEE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    
    case $(melee_sound_util) in
        ffplay)
            PLAY_COMMAND="ffplay -loglevel error -nodisp -autoexit"
        ;;

        pw-play)
            PLAY_COMMAND="pw-play"
        ;;

        paplay)
            PLAY_COMMAND="paplay"
        ;;

        aplay)
            PLAY_COMMAND="aplay"
        ;;

        *)
            echo -e "melee.sh: No suitable playback utility."
            echo -e "    >> Please install one of the following: ffplay, pw-play, paplay, or aplay"
            eval "$@"
            return $?
        ;;
    esac

    success() {
        ( $PLAY_COMMAND "$MELEE_DIR"/sounds/success.wav > /dev/null 2>&1 & disown)
        return 0
    }
    failure() {
        local rc=$?
        ( $PLAY_COMMAND "$MELEE_DIR"/sounds/failure.wav > /dev/null 2>&1 & disown)
        return $rc
    }
    # eval is used here to allow for alias resolution
    eval "$@" && success || failure
    return $?
}

melee_sound_util() { # Can be run independently for debugging / verification purposes.
    # FFPLAY (ffmpeg)
    if type ffplay >/dev/null 2>&1; then
        echo "ffplay"
        return 0
    fi

    # PW-PLAY (PipeWire)
    if type pw-play >/dev/null 2>&1; then
        echo "pw-play"
        return 0
    fi

    # PAPLAY (PulseAudio)
    if type paplay >/dev/null 2>&1; then
        echo "paplay"
        return 0
    fi

    # APLAY (Alsa)
    if type aplay >/dev/null 2>&1; then
        echo "aplay"
        return 0
    fi

    echo "none"
    return 1
}