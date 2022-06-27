import argparse
import itertools
import json
import os
import subprocess

from pathlib import Path
from typing import Any, List, cast


def print_padded(**vars: Any) -> None:
    keys = list(vars.keys())
    max_len = len(max(keys, key=len))

    print()

    for key, value in vars.items():
        pad = " " * (max_len - len(key))
        print(f"{key}{pad} = {value}")

    print()


def cmd(parts: List[str], debug: bool = True) -> None:
    command_str = " ".join(parts)

    if debug:
        # print(parts)
        print(command_str)

    p = subprocess.Popen(command_str, shell=True)
    p.communicate()


def send_keys_cmd(
    target: str,
    parts: List[str],
    run_cmd: bool = True,
    debug: bool = True,
) -> None:
    command_parts = list(itertools.chain.from_iterable([[p, "Space"] for p in parts]))
    command_parts = command_parts[:-1]

    if run_cmd:
        command_parts = command_parts + ["C-m"]

    cmd(["tmux", "send-keys", "-t", target] + command_parts, debug)


def main() -> None:
    HOME = Path(os.environ["HOME"])
    SYL_PATH = HOME / "Documents/projects/sylvera"

    with open(HOME / "dotfiles/tmux/sessions/session_details.json") as f:
        all_session_details = json.load(f)

    parser = argparse.ArgumentParser()
    parser.add_argument('-s', '--session', type=str)
    parser.add_argument('-b', '--base-dir', type=str)
    parser.add_argument('-e', '--env', type=str)
    parser.add_argument('-t', '--tower', type=str)
    parser.add_argument('-S', '--tower-session', type=str)
    args = parser.parse_args()

    session = args.session
    base_dir = args.base_dir
    env = args.env
    tower = args.tower
    tower_session = args.tower_session

    if not session:
        session = input("Session name: ")

    session_details = all_session_details.get(session)

    if session_details:
        base_dir = base_dir or session_details.get("base_dir")
        env = env or session_details.get("env")
        tower = tower or session_details.get("tower")
        tower_session = tower_session or session_details.get("tower_session", tower)

    if not env:
        env = input("Env name: ")

    if base_dir:
        base_dir = SYL_PATH / base_dir
    else:
        base_dir_exists = False

        while (not base_dir) or not base_dir_exists:
            base_dir = input("Session name: ")

            try:
                base_dir = Path(base_dir)
                base_dir_exists = base_dir.exists()
            except TypeError:
                pass

    base_dir = cast(Path, base_dir)
    print_padded(
        session=session,
        env=env,
        base_dir=base_dir,
        tower=tower,
        tower_session=tower_session,
    )

    os.chdir(base_dir)

    cmd(["tmux", "new-session", "-d", "-A", "-s", session])
    cmd(["tmux", "rename-window", "-t", "1", "code"])

    if env:
        send_keys_cmd("code", ["conda", "activate", env])

    send_keys_cmd("code", ["lvim"])

    cmd(["tmux", "new-window", "-t", f"{session}:2", "-n", "lazygit"])
    send_keys_cmd("lazygit", ["lazygit"])

    if tower:
        tower_index = tower[1:]
        cmd(["tmux", "new-window", "-t", f"{session}:3", "-n", "fswatch"])
        send_keys_cmd(
            "fswatch",
            ["sync_to_tower", tower_index, "-wgyK", "freddie", ".", base_dir.stem],
            False,
        )

        cmd(["tmux", "new-window", "-t", f"{session}:4", "-n", "tunnel"])
        send_keys_cmd(
            "tunnel",
            ["tunnel_to_tower", tower_index, "freddie", "20103"],
            False,
        )

        cmd(["tmux", "new-window", "-t", f"{session}:5", "-n", "zsh"])
        cmd(["tmux", "new-window", "-t", f"{session}:6", "-n", "tower"])
        send_keys_cmd(
            "tower",
            ["ssh", tower, "-t", "tmux", "new", "-d", "-A", "-s", tower_session],
        )
    else:
        cmd(["tmux", "new-window", "-t", f"{session}:3", "-n", "zsh"])

    cmd(["tmux", "select-window", "-t", f"{session}:code",])
    cmd(["tmux", "attach-session", "-t", session])


if __name__ == "__main__":
    main()
