#!/usr/bin/env python

import sys
import yaml
import datetime


def main(dbfile, action, stamp):
    """Update a YAML file of build timestamps

    Args:
        dbfile: YAML file name
        action: 'add', 'test', or 'rm'
        stamp: name of stamp
    """
    with open(dbfile, 'r') as f:
        data = yaml.load(f)
        if data is None:
            data = {}
    if action == 'add':
        data[stamp] = str(datetime.datetime.now())
    elif action == 'rm':
        if stamp in data:
            del data[stamp]
    elif action == 'test':
        if stamp in data:
            print(data[stamp])
            sys.exit(0)
        else:
            sys.exit(1)
    with open(dbfile, 'w') as f:
        f.write(yaml.dump(data, default_flow_style=False))


if __name__ == "__main__":
    main(*sys.argv[1:])

