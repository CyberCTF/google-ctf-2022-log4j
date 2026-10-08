# Upstream

| | |
| --- | --- |
| Project | Google CTF (official archive of challenges) |
| Repository | https://github.com/google/google-ctf |
| Challenge | `2022/quals/web-log4j` (Google CTF 2022) |
| Version | master (the archive has no releases) |
| Commit | 4a8f8d7808254d40f226ac2ab4604601e0e57d57 |
| Licence | Apache-2.0 |

| Here | google-ctf path |
| --- | --- |
| `build/web/app/` | [`2022/quals/web-log4j`](https://github.com/google/google-ctf/tree/4a8f8d7808254d40f226ac2ab4604601e0e57d57/2022/quals/web-log4j) |

The vendored folder is that commit's challenge folder, unchanged, without its Git history. The flag
is upstream's own (the `FLAG` environment variable set in `nsjail.cfg`).

`build/web/Dockerfile` is upstream's Dockerfile with the COPY sources under `app/` and one pin added: `werkzeug==2.1.2`. Upstream pins Flask 2.1.2 but not Werkzeug, and the Werkzeug 3 that pip now picks removed `url_quote`, so Flask fails to start. The header of the overlay lists every difference.

To update, replace the vendored folder with a newer google-ctf commit, then change this file.
