#
# Chef
#
# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CHEF_SHOW="${SPACESHIP_CHEF_SHOW=true}"
SPACESHIP_CHEF_PREFIX="${SPACESHIP_CHEF_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CHEF_SUFFIX="${SPACESHIP_CHEF_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CHEF_SYMBOL="${SPACESHIP_CHEF_SYMBOL=""}"
# The (A) expansion flag creates an array, the '=' activates word splitting
SPACESHIP_CHEF_COLOR="${SPACESHIP_CHEF_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Chef environment.
spaceship_chef() {
  [[ $SPACESHIP_CHEF_SHOW == false ]] && return

  # Check if there's a Chef env set
  [ -n "$CHEF_ENV" ] || return

  local 'chef_env'
  chef_env="$CHEF_ENV"

spaceship::section \
    "$SPACESHIP_CHEF_COLOR" \
    "$SPACESHIP_CHEF_PREFIX" \
    "${SPACESHIP_CHEF_SYMBOL}${chef_env}" \
    "$SPACESHIP_CHEF_SUFFIX"
}
