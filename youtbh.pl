#!/usr/bin/perl -w
# youtbh.pl
# INCLUDES
use strict;
use LWP::Simple;

use vars qw($VERSION %IRSSI);
use Irssi qw(
    settings_get_int settings_get_str
    settings_add_int settings_add_str
    signal_add_last
    );

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

# Message the channel? This is useful for bot-type situations
# but will be annoying as all hell if people aren't aware
settings_add_int('youtbh','message_channel',0);

sub sig_public {
    my ($server, $msg, $nick, $address, $channel) = @_;
    if ($msg =~ /https?:\/\/\w{0,3}.?youtube\.com\/watch\?v=[-_A-Za-z0-9]{11}/) {
        my $url = $&;
        my $content = get $url;
        die "Couldn't get $url" unless defined $content;

        my $title = "";

        if($content =~ /<title>(.*)<\/title>/ig) {
            $title = $1;
        }

	    if (settings_get_int('message_channel') == 1) {
	        $server->command("MSG $channel $title");
        } else {
            $server->command("ECHO -current $title");
        }
    }
}

Irssi::signal_add_last('message public', 'sig_public');
