7zetools
========

| **Linux** | **Mac** |
|-----------|---------|
| [![Linux](https://github.com/d99kris/7zetools/workflows/Linux/badge.svg)](https://github.com/d99kris/7zetools/actions?query=workflow%3ALinux) | [![macOS](https://github.com/d99kris/7zetools/workflows/macOS/badge.svg)](https://github.com/d99kris/7zetools/actions?query=workflow%3AmacOS) |

7zetools - 7-Zip Encryption Tools - is a set of shell scripts for Linux and macOS, that 
facilitate single file (or directory) encryption using 7-Zip AES-256.

Supported Platforms
===================
7zetools is primarily developed and tested on Linux, but basic functionality should work in
macOS / OS X as well. Current version has been tested on:
- OS X El Capitan 10.11
- Ubuntu 16.04 LTS

Linux / Ubuntu
==============

**Dependencies**

    sudo apt-get install p7zip-full realpath

**Source**

    git clone https://github.com/d99kris/7zetools && cd 7zetools

**Build**

    mkdir -p build && cd build && cmake .. && make -s

**Install**

    sudo make -s install

macOS
=====

**Dependencies**

    brew install p7zip bash

**Source**

    git clone https://github.com/d99kris/7zetools && cd 7zetools

**Build**

    mkdir -p build && cd build && cmake .. && make -s

**Install**

    make -s install

Usage
=====
7zetools contains six tools described individually below. 

7zpass
------
7zpass sets (or clears) the current encryption key - or "password" - for the 
user invoking the command. The encryption key is stored until next reboot, or
until the user sets the empty encryption key.

Example setting encryption key __5ecret__:

    $ 7zpass
    Enter password (will not be echoed) : 5ecret <ENTER>
    Verify password (will not be echoed) : 5ecret <ENTER>
    Password succesfully stored

Example clearing encryption key:

    $ 7zpass
    Enter password (will not be echoed) : <ENTER>
    Verify password (will not be echoed) : <ENTER>
    Password succesfully cleared

Note: The encryption key is stored in plaintext on volatile memory (RAM).

7zenc
-----
7zenc encrypts one specified file or directory (recursively), using the
encryption key set up using 7zpass. No compression is used, so the resulting
7z archive size will be similar to original file(s). The resulting file will be
named same as source file/directory with previous suffix removed and .7z added.
It will be stored in current directory.

Usage:

    7zenc <file|dir>

7zfind
------
7zfind searches 7z archives in the specified directory, for filenames
containing the search string. Optionally the matching files are
extracted if a destination path is specified, opionally limited to max
number of files.

Usage:

    7zfind <path> <searchstring> [destdir] [maxcnt]

7zlist
------
7zlist lists the content of specified 7z archives.

Usage:

    7zlist <path> [path ..]

7zdec
-----
7zdec decrypts specified .7z archive, using the encryption key set up using
7zpass. The decrypted files/directories are written to current directory.

Usage:

    7zdec <file>

7zopen
------
7zopen decrypts specified .7z archive to volatile memory (RAM) and opens the
files using systems default viewer/editor (or as manually specified by user). 
After the viewer/editor program has been closed, 7zopen updates any files in the
.7z archive that were modified.

Usage:

    7zopen [program] <file>

Note: This utility only makes sense to use when operating on .7z archives with
single file, or multiple files of same filetype (thus same editor/viewer can
be used).

7zopen may be user-configured to utilize a specific program for a certain
filetype. The configuration file shall be stored in $HOME/.7zetoolsrc and can 
specify a program for each mime-type. For example in order to use nano for all
files with mime-type text/plain add a line:

    TEXTPLAINPROG=nano

You may use 7zopen to determine mime-type in a 7z archive, as it outputs this 
information in the console upon opening the archive.

7zcd
----
7zcd decrypts specified .7z archive to volatile memory (RAM) and changes current
directory to the temporary directory with the decrypted files. It then spawns a
new bash shell instance, allowing the user to use the shell to make any 
modifications to the files/directories contained in the archive. When user exits
the shell, 7zcd encrypts all files and overwrites the original .7z archive.

Usage:

    7zcd <file>

Design Notes
============
Ease of use for single (or few) files encryption for use with cloud storage, 
such as Dropbox, has been driving most design decisions. As such 7zetools
provides streamlined operation, but requires the user to understand the
security implications.

License
=======
7zetools is distributed under BSD 3-Clause license. See LICENSE file.

Keywords
========
7z, single file encryption, dropbox, cloud storage, ease of use.

