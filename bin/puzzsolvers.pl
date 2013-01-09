#!/usr/bin/perl -w

use strict;
use warnings;

use lib qw(.);
BEGIN {
    require 'pblib.cfg';
}

use PB::Config;
use PB::API;
use CGI qw(:standard:);
use CGI qw(param);

my $debugp="false";
if($PB::Config::PB_DEV_VERSION ne "") {
    $debugp="true";
}

my $hidesolved = "";

if (param('hidesolved')){
	$hidesolved="checked";
}

my $showrounds = "";
if (param('showrounds')){
	$showrounds="checked";
}

my $editable;
my $title;
if (param('edit')){
	$editable = "true";
	$title = "$PB::Config::TEAM_NAME -- Puzzles-n-Solvers$PB::Config::PB_DEV_VERSION_POSTPAREN";
}

my $html = <<"EOF";
Content-type: text/html

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>$title</title>
    <style type="text/css">
        \@import "$PB::Config::PB_CSS_REL/pb.css";
		\@import "$PB::Config::DOJO_ROOT/dojo/resources/dnd.css";
		\@import "$PB::Config::DOJO_ROOT/dojo/resources/dojo.css";
		\@import "$PB::Config::DOJO_ROOT/dijit/themes/tundra/tundra.css";
    </style>
    <script type="text/javascript" src="$PB::Config::METEOR_JS_URI"></script>
    <script type="text/javascript" src="$PB::Config::DOJO_ROOT/dojo/dojo.js" 
            data-dojo-config="async: true, parseOnLoad: true"></script>
    <script type="text/javascript">

	var my_pbmrc;
	var my_pb;
    require({
		waitSeconds: 5,
	    },
		["../js/pb-meteor-rest-client.js", "../js/puzzsolvers.js"],
	    function(pbmrc,pb) {
		pbmrc.pb_set_config("$PB::Config::METEOR_HTTP_HOST", "$PB::Config::METEOR_VERSION_CHANNEL", "$PB::Config::PBREST_ROOT");
		my_pbmrc = pbmrc;
		my_pb = pb;
		pb.my_init(true);
	    });	

    </script>
</head>
<body class="tundra">
<h1>Puzzles-n-solvers</h1>
<h2>Solver Pool</h2>
<div id="poolcontainer" class = "container"></div>
<div id="puzzlecontainer"></div>
<div id="statuscontainer"></div>
</body>
</html>

EOF

print $html;