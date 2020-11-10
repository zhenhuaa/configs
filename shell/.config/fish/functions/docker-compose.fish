# docker-compose.fish - docker completions for fish shell
#
# This file is generated by gen_docker_fish_completions.py from:
# https://github.com/barnybug/docker-fish-completion
#
# To install the completions:
# mkdir -p ~/.config/fish/completions
# cp docker-compose.fish ~/.config/fish/completions
#
# Completion supported:
# - parameters
# - commands
# - services

function __fish_docker_no_subcommand --description 'Test if docker has yet to be given the subcommand'
    for i in (commandline -opc)
        if contains -- $i build config create down events exec help kill logs pause port ps pull restart rm run scale start stop unpause up version
            return 1
        end
    end
    return 0
end

function __fish_print_docker_compose_services --description 'Print a list of docker-compose services'
    docker-compose config --services ^/dev/null | command sort
end

# common options
complete -c docker-compose -n '__fish_docker_no_subcommand' -s f -l file -d 'Specify an alternate compose file (default: docker-compose.yml)'
complete -c docker-compose -n '__fish_docker_no_subcommand' -s p -l project-name -f -d 'Specify an alternate project name (default: directory name)'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l verbose -f -d 'Show more output'
complete -c docker-compose -n '__fish_docker_no_subcommand' -s v -l version -f -d 'Print version and exit'
complete -c docker-compose -n '__fish_docker_no_subcommand' -s H -l host -f -d 'Daemon socket to connect to'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l tls -f -d 'Use TLS; implied by --tlsverify'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l tlscacert -d 'Trust certs signed only by this CA'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l tlscert -d 'Path to TLS certificate file'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l tlskey -d 'Path to TLS key file'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l tlsverify -f -d 'Use TLS and verify the remote'
complete -c docker-compose -n '__fish_docker_no_subcommand' -l skip-hostname-check -f -d "Don't check the daemon's hostname against the name specified"

# subcommands
# build
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a build -d 'Build or rebuild services'
complete -c docker-compose -A -n '__fish_seen_subcommand_from build' -l force-rm -f -d 'Always remove intermediate containers.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from build' -l no-cache -f -d 'Do not use cache when building the image.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from build' -l pull -f -d 'Always attempt to pull a newer version of the image.'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from build' -a '(__fish_print_docker_compose_services)' -d "Service"

# config
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a config -d 'Validate and view the compose file'
complete -c docker-compose -A -n '__fish_seen_subcommand_from config' -s q -l quiet -f -d "Only validate the configuration, don't print"
complete -c docker-compose -A -n '__fish_seen_subcommand_from config' -l services -f -d 'Print the service names, one per line.'

# create
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a create -d 'Create services'
complete -c docker-compose -A -n '__fish_seen_subcommand_from create' -l force-recreate -f -d 'Recreate containers even if their configuration and'
complete -c docker-compose -A -n '__fish_seen_subcommand_from create' -l no-recreate -f -d "If containers already exist, don't recreate them."
complete -c docker-compose -A -n '__fish_seen_subcommand_from create' -l no-build -f -d "Don't build an image, even if it's missing."
complete -c docker-compose -A -n '__fish_seen_subcommand_from create' -l build -f -d 'Build images before creating containers.'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from create' -a '(__fish_print_docker_compose_services)' -d "Service"

# down
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a down -d 'Stop and remove containers, networks, images, and volumes'
complete -c docker-compose -A -n '__fish_seen_subcommand_from down' -l rmi -f -d "Remove images, type may be one of: 'all' to remove"
complete -c docker-compose -A -n '__fish_seen_subcommand_from down' -s v -l volumes -f -d 'Remove data volumes'
complete -c docker-compose -A -n '__fish_seen_subcommand_from down' -l remove-orphans -f -d 'Remove containers for services not defined in'

# events
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a events -d 'Receive real time events from containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from events' -l json -f -d 'Output events as a stream of json objects'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from events' -a '(__fish_print_docker_compose_services)' -d "Service"

# exec
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a exec -d 'Execute a command in a running container'
complete -c docker-compose -A -n '__fish_seen_subcommand_from exec' -s d -f -d 'Detached mode: Run command in the background.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from exec' -l privileged -f -d 'Give extended privileges to the process.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from exec' -l user -f -d 'Run the command as this user.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from exec' -s T -f -d 'Disable pseudo-tty allocation. By default `docker-compose exec`'
complete -c docker-compose -A -n '__fish_seen_subcommand_from exec' -l index=index -f -d 'index of the container if there are multiple'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from exec' -a '(__fish_print_docker_compose_services)' -d "Service"

# help
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a help -d 'Get help on a command'

# kill
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a kill -d 'Kill containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from kill' -s s -f -d 'SIGNAL to send to the container.'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from kill' -a '(__fish_print_docker_compose_services)' -d "Service"

# logs
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a logs -d 'View output from containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from logs' -l no-color -f -d 'Produce monochrome output.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from logs' -s f -l follow -f -d 'Follow log output.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from logs' -s t -l timestamps -f -d 'Show timestamps.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from logs' -l tail="all" -f -d 'Number of lines to show from the end of the logs'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from logs' -a '(__fish_print_docker_compose_services)' -d "Service"

# pause
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a pause -d 'Pause services'

# port
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a port -d 'Print the public port for a port binding'
complete -c docker-compose -A -n '__fish_seen_subcommand_from port' -l protocol=proto -f -d 'tcp or udp [default: tcp]'
complete -c docker-compose -A -n '__fish_seen_subcommand_from port' -l index=index -f -d 'index of the container if there are multiple'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from port' -a '(__fish_print_docker_compose_services)' -d "Service"

# ps
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a ps -d 'List containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from ps' -s q -f -d 'Only display IDs'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from ps' -a '(__fish_print_docker_compose_services)' -d "Service"

# pull
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a pull -d 'Pulls service images'
complete -c docker-compose -A -n '__fish_seen_subcommand_from pull' -l ignore-pull-failures -f -d 'Pull what it can and ignores images with pull failures.'

# restart
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a restart -d 'Restart services'
complete -c docker-compose -A -n '__fish_seen_subcommand_from restart' -s t -l timeout -f -d 'Specify a shutdown timeout in seconds.'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from restart' -a '(__fish_print_docker_compose_services)' -d "Service"

# rm
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a rm -d 'Remove stopped containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from rm' -s f -l force -f -d "Don't ask to confirm removal"
complete -c docker-compose -A -n '__fish_seen_subcommand_from rm' -s v -f -d 'Remove volumes associated with containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from rm' -s a -l all -f -d 'Also remove one-off containers created by'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from rm' -a '(__fish_print_docker_compose_services)' -d "Service"

# run
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a run -d 'Run a one-off command'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -s d -f -d 'Detached mode: Run container in the background, print'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -l name -f -d 'Assign a name to the container'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -l entrypoint -f -d 'Override the entrypoint of the image.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -s e -f -d 'Set an environment variable (can be used multiple times)'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -s u -l user="" -f -d 'Run as specified username or uid'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -l no-deps -f -d "Don't start linked services."
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -l rm -f -d 'Remove container after run. Ignored in detached mode.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -s p -l publish=[] -f -d "Publish a container's port(s) to the host"
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -l service-ports -f -d "Run command with the service's ports enabled and mapped"
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -s T -f -d 'Disable pseudo-tty allocation. By default `docker-compose run`'
complete -c docker-compose -A -n '__fish_seen_subcommand_from run' -s w -l workdir="" -f -d 'Working directory inside the container'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from run' -a '(__fish_print_docker_compose_services)' -d "Service"

# scale
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a scale -d 'Set number of containers for a service'
complete -c docker-compose -A -n '__fish_seen_subcommand_from scale' -s t -l timeout -f -d 'Specify a shutdown timeout in seconds.'

# start
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a start -d 'Start services'

# stop
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a stop -d 'Stop services'
complete -c docker-compose -A -n '__fish_seen_subcommand_from stop' -s t -l timeout -f -d 'Specify a shutdown timeout in seconds.'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from stop' -a '(__fish_print_docker_compose_services)' -d "Service"

# unpause
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a unpause -d 'Unpause services'

# up
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a up -d 'Create and start containers'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -s d -f -d 'Detached mode: Run containers in the background,'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l no-color -f -d 'Produce monochrome output.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l no-deps -f -d "Don't start linked services."
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l force-recreate -f -d 'Recreate containers even if their configuration'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l no-recreate -f -d "If containers already exist, don't recreate them."
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l no-build -f -d "Don't build an image, even if it's missing."
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l build -f -d 'Build images before starting containers.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l abort-on-container-exit -f -d 'Stops all containers if any container was stopped.'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -s t -l timeout -f -d 'Use this timeout in seconds for container shutdown'
complete -c docker-compose -A -n '__fish_seen_subcommand_from up' -l remove-orphans -f -d 'Remove containers for services not'
complete -c docker-compose -A -f -n '__fish_seen_subcommand_from up' -a '(__fish_print_docker_compose_services)' -d "Service"

# version
complete -c docker-compose -f -n '__fish_docker_no_subcommand' -a version -d 'Show the Docker-Compose version information'
complete -c docker-compose -A -n '__fish_seen_subcommand_from version' -l short -f -d "Shows only Compose's version number."


