#!/usr/bin/env bash

# {{{ Vars
ACPI="/sys/devices/platform/thinkpad_acpi"
BAT="/sys/devices/platform/smapi/BAT0"
BL="/sys/class/backlight/intel_backlight/brightness"
BT="${ACPI}/bluetooth_enable"
# }}}

# {{{ Network
alias wolh="wol 40:61:86:87:F3:FE"
alias sshh="ssh ${_HTPC}"
alias pingh="ping 192.168.0.2"
# }}}

# {{{ Display
if have backlight; then
    alias bl=backlight
fi

doff() {
    local cmd
    [[ "$1" ]] && cmd="ssh ${_HTPC} DISPLAY=:0 "
    cmd+="xset dpms force off"
    eval ${cmd}
}
don() {
    local cmd
    [[ "$1" ]] && cmd="ssh ${_HTPC} DISPLAY=:0 "
    cmd+="xset dpms force on"
    eval ${cmd}
}

# Small script to control idle sleep/suspend/standby. Xautolock can be toggled on the fly
# but does not support a status feedback besides "process exists" so it's best to use on/off instead of toggle.
idlesuspend() {
    ! have xautolock && echo "Please install xautolock first." && return 1
    case "$1" in
        off|disable|0)
            xautolock -disable;;
        on|enable)
            xautolock -enable;;
        [0-9]*)
            [[ "$(pgrep xautolock)" ]] && (xautolock -exit || pkill xautolock) && sleep 1
            xautolock -time "$1" -locker "systemctl suspend" -detectsleep &>/dev/null &;;
        exit|quit)
            (xautolock -exit || pkill "xautolock") && sleep 1;;
        toggle)
            xautolock -toggle;;
        '');;
        *)
            echo "Usage: idlesuspend [ off | toggle | <time> ]";;
    esac
    local xautolock_process="$(pgrep -a "xautolock")"
    [[ "${xautolock_process}" ]] && echo "running: ${xautolock_process}" || echo "xautolock is not running."
}
# }}}





