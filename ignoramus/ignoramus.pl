#
# Ignoramus - nobody loves you, nobody wanna listen
#
# TODO:
# - option to warn when ignored yourself
# - option to disable ignore entry hit if same line retried N times on same item consecutively


use Irssi;
use strict;
use vars qw($VERSION %IRSSI);

$VERSION = "0.01";
%IRSSI = (
    authors     => 'Gustavo De Nardin (spuk)',
    name        => 'ignoramus',
    description => 'Ignore yourself',
    license     => 'Public Domain'
);


sub ignoramus {
  my ($line, $server, $witem) = @_;
  my $nick = $witem->{server}->{nick};
  my $host = $witem->{server}->{userhost};
  my $channel = $witem->{name};

  if ($witem->{server}->ignore_check($nick, $host, $channel, $line, MSGLEVEL_PUBLIC+MSGLEVEL_MSGS)) {
    Irssi::signal_stop();
  }
}

Irssi::signal_add("send text", "ignoramus");
