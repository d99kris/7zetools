7zetools
========

| **Linux** |
|-----------|
| [![Build status](https://travis-ci.org/d99kris/7zetools.svg?branch=master)](https://travis-ci.org/d99kris/7zetools) |

7zetools - 7-Zip Encryption Tools - is a set of Linux shell scripts to 
facilitate single file (or directory) encryption using 7-Zip AES-256.

Supported Platforms
===================
7zetools should work on most Linux systems where its dependencies are met; 
7z and realpath.

It has been tested on:
- Ubuntu 14.04, Ubuntu 16.04
- openSUSE 13.2

Installation
============

Dependencies
------------

Ubuntu

    sudo apt-get install p7zip-full realpath

openSUSE

    sudo zypper install p7zip coreutils

Configure and Build
-------------------
    mkdir -p build && cd build && cmake .. && make -s

Optionally Install
------------------
    sudo make install

Usage
=====
7zetools contains five tools described individually below. 

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

