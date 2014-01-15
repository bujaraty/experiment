use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'My::Module',
    AUTHOR              => q{Jessada Thutkawkorapin <your@email.com>},
    VERSION_FROM        => 'lib/My/Module.pm',
    ABSTRACT_FROM       => 'lib/My/Module.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'My-Module-*' },
);
