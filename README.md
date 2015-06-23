# docker-pdns_recursor

You may want a simple DNS server for you local network. This docker container will do just that.

All you have to do is edit the [forward-zones](forward-zones) file to what you want and the container'll host the DNS entry.

If you update anything in the [recursor.conf](recursor.conf) you'll need to restart the container, otherwise the application is smart enough to read the zones file.

I suggest you create something like `/home/$USER/dns/` to do the mount location for forward-zones file and recursor.conf.

# Installation

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future.

```
docker pull jjasghar/pdns_recursor:latest
```

Alternately you can build the image yourself.

```
git clone https://github.com/jjasghar/docker-pdns_recursor.git
cd docker-pdns_recursor
docker build -t="$USER/pdns_recursor" .
```

You'll want to copy the config files into the location you've created so they are readable by the container, I've tried to do some sane defaults.

# Quick Start

Run the image from the build

```
docker run --name='pdns_recursor' -d -p 53:53/udp /
-v /home/$USER/dns:/conf $USER/pdns_recursor
```

Run the image from the registry

```
docker run --name='pdns_recursor' -d -p 53:53/udp /
-v /home/$USER/dns:/conf jjasghar/pdns_recursor
```

# Help/Suggestions

If you have any suggestions or ideas to help I'm all ears. This was created to just get a simple DNS server for my internal network up and running as quickly asa possible.
