#!/usr/bin/env python3

import pathlib
from pathlib import os

OK_BLUE = '\033[94m'
WARNING_YELLOW = '\033[93m'
END_COLOR = '\033[0m'

def install_dir(src_files, dst_dir):
	for src in src_files:
		dst = dst_dir/src.name

		if dst.resolve() == src:
			print(f"{OK_BLUE}info: {dst} is already linked correctly, skipping.{END_COLOR}")
			continue

		if dst.exists():
			dst_suffix = dst.with_suffix(".backup")
			dst.rename(dst_suffix)
			print(f"{WARNING_YELLOW}warning: {dst} already exists, it was renamed to {dst_suffix}.{END_COLOR}")

		dst.symlink_to(src)


home_dir = pathlib.Path.home()
xdg_config_home = os.getenv("XDG_CONFIG_HOME")
config_dir = pathlib.Path(xdg_config_home) if xdg_config_home else home_dir/".config"

script_home_dir = pathlib.Path(os.path.dirname(os.path.realpath(__file__)))
script_config_dir = script_home_dir/".config"

ignored_home_files = {
    script_home_dir/".git",
    script_home_dir/".gitignore",
    script_home_dir/".gitattributes",
    script_home_dir/"install.py",
    script_home_dir/"README.md",
    script_home_dir/".config"
}

home_files = list(filter(lambda file: file.resolve() not in ignored_home_files, script_home_dir.glob('*')))
config_files = list(script_config_dir.glob("*"))

install_dir(home_files, home_dir)
install_dir(config_files, config_dir)