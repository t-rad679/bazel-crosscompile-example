load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

register_toolchains(
    "//toolchain:docker_toolchain",
)

http_archive(
# new_local_repository(
    name = "cross_toolchain",
#    path = "/Users/ilya/x86_64-unknown-linux-gnu/"
#    url = "https://github.com/ipolyakovskiy/osx-x86_64-linux-gnu-gcc/releases/download/v1.0/x86_64-linux-gnu-cross-toolchain.zip",
    url = "https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz?rev=9acdbd6baca94a3d8df241d654d9f0d1&hash=0CB46263EB231C26CD56A8C38FCFEF26",
    integrity = "sha256-/oZLKxUSf1iGehcc/NY5MYYJ5zT7yLeLtAJYMSohoJc=",
    strip_prefix = "arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64_be-none-linux-gnu",
    build_file_content="""
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
"""
)


