#!/usr/bin/perl

use inc::Module::Install;

name		('App-CLI');
author		('Chia-liang Kao <clkao@clkao.org>');
abstract_from	('lib/App/CLI.pm');
license		('perl');
version_from	('lib/App/CLI.pm');

requires(
    'Locale::Maketext::Simple' => 0,
    'Getopt::Long'             => '2.35',
    'Pod::Simple::Text'        => 0,
);

include('ExtUtils::AutoInstall');
auto_install();

WriteAll( sign => 1 );
