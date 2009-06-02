#!/usr/bin/perl -w
# youtbh.pl
# INCLUDES
use strict;
use LWP::Simple;

use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = '1.01';
%IRSSI = (
    authors     => 'nosmo',
    contact     => 'nosmo@netsoc.tcd.ie',
    name        => 'youtbh',
    description => 'Find out what those ' .
                   'stupid incessant ' .
                   'youtube links ARE',
    license     => 'Public Domain',
	  );

# Declare variables


sub sig_public {
    my ($server, $msg, $nick, $address, $channel) = @_;
    if ($msg =~ /http:\/\/\w{0,3}.?youtube\.com\/watch\?v=[-_A-Za-z0-9]{11}/) {
        my $url = $&;
        my $content = get $url;
        die "Couldn't get $url" unless defined $content;

        my $title = "";

        if($content =~ /<title>(.*)<\/title>/ig) {
            $title = $1;
        }

	Irssi::print("$url ::  $title");
	$server->command("MSG $channel $url :: $title");
    }
}

Irssi::signal_add_last('message public', 'sig_public');
