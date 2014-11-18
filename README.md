youtbh
========

youtbh is a simple Perl plugin for [irssi](http://www.irssi.org/)
that reveals the title of youtube links that appear in a channel.

Links will reveal themselves as a message in the current window like
so:

```
22:28 -!- Geoff Berner - Dalloy Polizei - YouTube
22:28 < nosmo> https://www.youtube.com/watch?v=YtmQNeYT3KU
```

If the message_channel variable is set to 1, the title of the video
will be outputted as a message to the channel. Don't be a jerk.

Installation
--------

Copy youtbh.pl to ~/.irssi/scripts and then ```/script load youtbh```.

Requirements
--------
* LWP::Simple.
