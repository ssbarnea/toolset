# toolset

[![Build Status](https://travis-ci.org/ssbarnea/toolset.svg?branch=master)](https://travis-ci.org/ssbarnea/toolset)

Kitchen-sink Toolset Collection of small scripts and utilities that do not deserve their own repository

## untox

Script that wipes all packages installation commands from tox.ini in order to allow
testing with system packages only. Useful for those that want to prepare for distributing
python packagees using system packages (RPMs, DEBs, ...)
