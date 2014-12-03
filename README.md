install-software
================

Little Perl script to automate software installation on Mac OS X (DMG-Files, pkg-Installer)

Tested on Mac OS X 10.9 (Mavericks) and Mac OS X 10.10 (Yosemite)

## Example usage

Change $baseDir to the location of the dmg-files

This installs Firefox:

> copyFromDmg("$baseDir/Firefox 34.0.5.dmg", "Firefox.app");

This installs XQuartz (requires to execute the perl script with sudo):

> installFromDmg("$baseDir/XQuartz-2.7.7.dmg", "XQuartz.pkg");
