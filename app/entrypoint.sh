#!/usr/bin/env bash
set -euo pipefail

_err() {
  1>&2 echo $@
  exit 1
}

[ "${HETZNER_USERNAME:-}" = "" ] && _err "HETZNER_USERNAME env not given"
[ "${HETZNER_PASSWORD:-}" = "" ] && _err "HETZNER_PASSWORD env not given"

hetznerctl config login.username "$HETZNER_USERNAME"
hetznerctl config login.password "$HETZNER_PASSWORD"

if [ "${HETZNER_DEV:-}" = "yes" ]; then
  echo "HANG"
  tail -f /dev/null &
  wait $!
fi

exec hetznerctl "$@"