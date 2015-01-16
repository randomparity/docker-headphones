docker-headphones
=================

Headphones daemon running in a container. The default paths have been altered to:

 * `/config`
 * `/download`
 * `/media`

`headphones` runs with the HTTP RPC interface listening on TCP port `8181`. The HTTP RPC interface is configured to not use authentication.

Assumptions
-----------

I use a NAS with a "download" share with the following structure:

  - Download                  - Completed downloads
  - Download\Usenet           - Watch directory for .nzb files
  - Download\Usenet\Working   - Working directory where "in progress" files are located
  - Download\Torrents         - Watch directory for .torrent files
  - Download\Torrents\Working - Working directory where "in progress" files are located

The `download` directory is mounted from `/mnt/download`, the `config` directory is mounted from `/etc/docker/headphones`, the `media` directory is mounted from `/mnt/media/music`.

Quick-start
-----------

`docker run -d --restart always -h headphones --name headphones -v /mnt/download:/download -v /etc/docker/headphones:/config -v /mnt/media/music:/media -v /etc/localtime:/etc/localtime:ro -p 8181:8181 randomparity/docker-headphones:latest`

Then open `http://<docker host IP>:8181` in a browser.
