# Google CTF 2022: Log4j

[Log4j](https://github.com/google/google-ctf/tree/4a8f8d7808254d40f226ac2ab4604601e0e57d57/2022/quals/web-log4j), a web challenge from [Google CTF](https://capturetheflag.withgoogle.com/) 2022
(the official archive [google/google-ctf](https://github.com/google/google-ctf), by Google): a Flask chat page that runs a Java chatbot logging every message with Log4j 2, which holds the flag in its environment.
This repository runs it with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machine,
built by the overlay Dockerfile in [`build/web/`](build/web) (what differs from upstream is in its header).

| Machine | Service |
| --- | --- |
| web | the chat site (Flask, gunicorn, nsjail) on port 1337, published on 1337 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:1337/. The challenge runs in nsjail under kCTF's setup script, so the machine is privileged. The same spec runs as Docker on a local VM (`docker-vm`), on a
cloud VM (`cloud-docker`) or on Kubernetes. The archive has no official write-up for this challenge; public write-ups are listed on CTFtime.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

Apache-2.0, as the Google CTF archive ([LICENSE](LICENSE)). The third-party software inside the image keeps its own
licence. This challenge is deliberately vulnerable: keep it isolated.
