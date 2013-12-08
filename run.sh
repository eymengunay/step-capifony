#!/bin/sh

# First make sure capifony is installed
if ! type capifony &> /dev/null ; then
    if ! type gem &> /dev/null ; then
        fail "neither capifony nor ruby gem found."
    else
        info "capifony was not found, installing"
        sudo gem install capifony
    fi
else
    info "capifony is available"
    debug "capifony version: $(capifony --version)"
fi

capifony_command="cap"

# Parse some variable arguments
if [ -n "$WERCKER_CAPIFONY_STAGE" ] ; then
    capifony_command="$capifony_command $WERCKER_CAPIFONY_STAGE"
fi

if [ -n "$WERCKER_CAPIFONY_TASKS" ] ; then
    capifony_command="$capifony_command $WERCKER_CAPIFONY_TASKS"
else
    capifony_command="$capifony_command deploy"
fi

debug "$capifony_command"
$capifony_command

if [[ $? -ne 0 ]]; then
    warn "$result"
    fail "capifony command failed"
else
    success "finished $capifony_command"
fi