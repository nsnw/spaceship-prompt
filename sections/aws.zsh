#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW=true}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  # Check if the AWS-cli is installed
  spaceship::exists aws || return

  # Is the current profile not the default profile
  [[ -z $AWS_PROFILE ]] || [[ "$AWS_PROFILE" == "default" ]] && return

  if [[ ! -z ${AWS_OKTA_SESSION_EXPIRATION} ]]; then
    NOW=$(date +"%s")

    # Expired?
    if [[ ${NOW} -ge ${AWS_OKTA_SESSION_EXPIRATION} ]]; then
      EXPIRES="%{%b%}(expired)"
    else
      SECONDS_LEFT=$(( ${AWS_OKTA_SESSION_EXPIRATION} - ${NOW} ))
      EXPIRES="%{%b%}($(spaceship::displaytime ${SECONDS_LEFT}))"
    fi
  else
    EXPIRES=""
  fi

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AWS_COLOR" \
    "$SPACESHIP_AWS_PREFIX" \
    "${SPACESHIP_AWS_SYMBOL}$AWS_PROFILE ${EXPIRES}" \
    "$SPACESHIP_AWS_SUFFIX"
}
