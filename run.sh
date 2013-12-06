#!/bin/sh

# First make sure capifony is installed
if ! type capifony &> /dev/null ; then
    info "capifony was not found, installing"
    sudo gem install capifony
else
    info "capifony is available"
    debug "capifony version: $(capifony --version)"
fi

capifony_command="cap"

# Parse some variable arguments
if [ -n "$WERCKER_CAP_STAGE" ] ; then
    capifony_command="$capifony_command $WERCKER_CAP_STAGE"
fi

if [ -n "$WERCKER_CAP_TASKS" ] ; then
    capifony_command="$capifony_command $WERCKER_CAP_TASKS"
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