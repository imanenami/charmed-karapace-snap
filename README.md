# Charmed Karapace snap repository.

[![Snapcraft Badge](https://snapcraft.io/charmed-karapace/badge.svg)](https://snapcraft.io/charmed-karapace)
[![Release](https://github.com/canonical/charmed-karapace-snap/actions/workflows/publish.yaml/badge.svg)](https://github.com/canonical/charmed-karapace-snap/actions/workflows/publish.yaml)

## Building

To build locally, use `snapcraft --debug`

## Using the snap

Install the snap (e.g. `sudo snap install ./charmed-karapace_3.12.0_amd64.snap --dangerous --devmode`).

To run the snap, you will require a running Kafka cluster. You can use the following:

```bash
# installing kafka cluster
sudo snap install charmed-zookeeper --channel 3/edge
sudo snap install charmed-kafka --channel 3/edge

# copying default config
sudo cp /snap/charmed-kafka/current/opt/kafka/config/server.properties /var/snap/charmed-kafka/current/etc/kafka/server.properties
sudo cp /snap/charmed-zookeeper/current/opt/zookeeper/conf/zoo_sample.cfg /var/snap/charmed-zookeeper/current/etc/zookeeper/zoo.cfg

# starting services
sudo snap start charmed-zookeeper
sleep 5
sudo snap start charmed-kafka
sleep 5
sudo snap start charmed-karapace
```

### Configuration

Place your custom karapace configuration in the snap data directory at `/var/snap/charmed-karapace/current/etc/karapace/karapace.config.json`.

To enable custom credentials, place your authfile at the snap data directory at `/var/snap/charmed-karapace/etc/karapace/authfile.json`.

### Apps

- `mkpasswd` will allow to create a user credentials json. This output can be used on the authfile.
```bash
$ charmed-karapace.mkpasswd -u user mypassword
{
    "username": "user",
    "algorithm": "sha512",
    "salt": "VX0dz5CgpOxJsn0NX5GVjQ",
    "password_hash": "bewGXsP0wtQ+k5\/\/bU4IpSVijTRCLVQL65RYF956WPDkrqxTm7aaTPC5wUAf7ReMqeOwWYaU9qAS8jJEiaW39Q=="
}
```

- `version` will output the running version
```bash
$ charmed-karapace.version
3.12.0
```
