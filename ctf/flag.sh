#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) in /chroot/ctf/flag (the chatbot's java wrapper exports it as FLAG);
# without one (CI, a run by hand) the development flag.
dev='CTF{dev-google-ctf-2022-log4j}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev}" > /chroot/ctf/flag
chmod 444 /chroot/ctf/flag
