#
# Consul
#
# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CONSUL_SHOW="${SPACESHIP_CONSUL_SHOW=true}"
SPACESHIP_CONSUL_PREFIX="${SPACESHIP_CONSUL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CONSUL_SUFFIX="${SPACESHIP_CONSUL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CONSUL_SYMBOL="${SPACESHIP_CONSUL_SYMBOL=""}"
# The (A) expansion flag creates an array, the '=' activates word splitting
SPACESHIP_CONSUL_COLOR="${SPACESHIP_CONSUL_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Consul token name.
spaceship_consul() {
  [[ $SPACESHIP_CONSUL_SHOW == false ]] && return

  # Check if there's a Consul token set
  [ -n "$CONSUL_TOKEN_NAME" ] || return

  local 'consul_token'
  consul_token="$CONSUL_TOKEN_NAME"

spaceship::section \
    "$SPACESHIP_CONSUL_COLOR" \
    "$SPACESHIP_CONSUL_PREFIX" \
    "${SPACESHIP_CONSUL_SYMBOL}${consul_token}" \
    "$SPACESHIP_CONSUL_SUFFIX"
}
