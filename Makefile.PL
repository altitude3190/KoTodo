use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'KoTodo',
    VERSION_FROM  => 'lib/KoTodo.pm',
    PREREQ_PM     => {
        'Kossy' =>  '0.38',
    },
    MIN_PERL_VERSION => '5.008001'
);

