
sub copyFromDmg {
	my $dmgFile = $_[0];
	my $appFile = $_[1];
	my ($deviceFile, $mountPoint) = mountDmg($dmgFile);
	print "copy $appFile\n";
	my $cpResult = `cp -R "$mountPoint/$appFile" /Applications`;
	umountDmg($deviceFile);
}

sub installFromDmg {
	my $dmgFile = $_[0];
	my $installerFile = $_[1];
	my ($deviceFile, $mountPoint) = mountDmg($dmgFile);
	print "installing $installerFile";
	`installer -package "$mountPoint/$installerFile" -target "/Volumes/Macintosh HD"`;
	umountDmg($deviceFile);
}

sub mountDmg { # Parameter: DMG-File
	my $dmgFile = $_[0];
	print "mounting $dmgFile\n";
	my $attachResult = `hdiutil attach "$dmgFile"`;
	my @attachResultLines = split /\n/, $attachResult; # split result spring by \n to separate lines
	my $lastLine = $attachResultLines[-1];
	my @lastLineWords = split /\t/, $lastLine;
	my $deviceFile = $lastLineWords[0];
	my $mountPoint = $lastLineWords[2];
	print "deviceFile = $deviceFile\n";
	print "mountPoint = $mountPoint\n";
	return ($deviceFile, $mountPoint);
}

sub umountDmg { # Parameter: DeviceFile
	my $deviceFile = $_[0];
	print "unmounting $deviceFile\n";
	my $detachResult = `hdiutil detach $deviceFile`;
}

my $baseDir = ".";

#copyFromDmg("$baseDir/Editra-0.7.20.dmg", "Editra.app");

copyFromDmg("$baseDir/Apache_OpenOffice_4.1.1_MacOS_x86-64_install_de.dmg", "OpenOffice.app");

copyFromDmg("$baseDir/Firefox 34.0.5.dmg", "Firefox.app");

copyFromDmg("$baseDir/gimp-2.8.14.dmg", "Gimp.app");

copyFromDmg("$baseDir/Inkscape-0.48.5+X11.dmg", "Inkscape.app");

copyFromDmg("$baseDir/googlechrome.dmg", "Google Chrome.app");

copyFromDmg("$baseDir/GoogleEarthMac-Intel.dmg", "Google Earth.app");

copyFromDmg("$baseDir/Komodo-Edit-8.5.4-14424-macosx-x86_64.dmg", "Komodo Edit 8.app");

copyFromDmg("$baseDir/TextWrangler_4.5.11.dmg", "TextWrangler.app");

#installFromDmg("$baseDir/XQuartz-2.7.7.dmg", "XQuartz.pkg");


