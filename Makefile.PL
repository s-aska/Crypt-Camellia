use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'Crypt::Camellia',
    'VERSION_FROM' => 'Camellia.pm',
    'PREREQ_PM' => {},
    'AUTHOR' => 'Julius C. Duque',
    'LIBS' => [''],
    'DEFINE' => '',
    'INC' => '-I.',
    'dist' => {'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz'}
);

