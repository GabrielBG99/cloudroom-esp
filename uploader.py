#!/usr/bin/env python3

import subprocess
from pathlib import Path


def main():
    src = Path(__file__).parent.resolve() / 'src'

    files = []
    for item in src.iterdir():
        if item.is_file() and item.name.endswith('.lua'):
            path = item.as_posix()
            name = item.name
            files.append(f'{path}:{name}')

    subprocess.run(['nodemcu-uploader', 'upload', *files, '--restart'])


if __name__ == "__main__":
    main()
