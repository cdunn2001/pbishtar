#!/usr/bin/env python2.7
import cStringIO
import os.path
import re
import sys


def has_shebang(ifo):
    """Given input-fileobj, return whether it starts with shebang.
    (This can be used to avoid problems with binary files.)

    >>> has_shebang(cStringIO.StringIO('#!foo'))
    True
    >>> has_shebang(cStringIO.StringIO(''))
    False
    """
    chunk = ifo.read(2)
    return chunk == '#!'


re_shebang_line = re.compile(r'^#![^\n]*')

def modified_shebang(content, new_shebang='#!/bin/env python'):
    r"""Given the content of a file, return its content
    modified with the given shebang line.

    >>> modified_shebang('#!foo bar\nhello', '#!/bin/env program')
    '#!/bin/env program\nhello'
    """
    return re_shebang_line.sub(new_shebang, content)


def maybe_fix(fn):
    """Maybe modify a file.
    """
    if not os.path.isfile(fn):
        return False
    with open(fn) as ifo:
        if not has_shebang(ifo):
            return False
    with open(fn) as ifo:
        first_line = ifo.readline()
        if 'python' not in first_line:
            return False
    old_content = open(fn).read()
    new_content = modified_shebang(old_content, '#!/usr/bin/env python2.7')
    if new_content == old_content:
        return False
    open(fn, 'w').write(new_content)
    return True


def main():
    """Operate on all files in the current directory.
    """
    for fn in os.listdir('.'):
        if maybe_fix(fn):
            print fn


if __name__ == '__main__':
    main()
