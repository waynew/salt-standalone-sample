# salt-standalone-sample

From salt/#6575:

> The workflow I'd like to be able to use is:
> - login to the machine
> - git checkout
> - cd into repository's deploy directory, run salt against top.sls

This is an example of how to do that. For simplicity's sake, you can just use
the Dockerfile like so:

    docker build -t salt-standalone .
    docker run -it -p 5042:5042 --rm --name salty_app salt-standalone
    # Now in the docker container
    git clone https://github.com/waynew/salt-standalone-sample.git .  # note the `.`
    salt-call --config-dir=/path/to/repo --local state.highstate

Now you'll have a (very) simple server up and running - from your host you
should be able to run:

    curl localhost:5042

And you should see this:

    Hey, it works! Try /hello maybe?
