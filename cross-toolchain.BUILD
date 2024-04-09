package(default_visibility = ['//visibility:public'])

filegroup(
    name = "all",
    srcs = glob(["**/*"])
)

filegroup(
    name = 'gcc',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-gcc',
    ],
)

filegroup(
    name = 'ar',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-ar',
    ],
)

filegroup(
    name = 'ld',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-ld',
    ],
)

filegroup(
    name = 'nm',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-nm',
    ],
)

filegroup(
    name = 'objcopy',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-objcopy',
    ],
)

filegroup(
    name = 'objdump',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-objdump',
    ],
)

filegroup(
    name = 'strip',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-strip',
    ],
)

filegroup(
    name = 'as',
    srcs = [
        'bin/aarch64_be-none-linux-gnu-as',
    ],
)

filegroup(
    name = 'compiler_components',
    srcs = [
        ':gcc',
        ':ar',
        ':ld',
        ':nm',
        ':objcopy',
        ':objdump',
        ':strip',
        ':as',
    ],
)

filegroup(
    name = 'compiler_pieces',
    srcs = glob([
        'aarch64_be-none-linux-gnu/**',
        'lib/**',
    ]),
)

