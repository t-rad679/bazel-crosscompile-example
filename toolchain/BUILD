package(default_visibility = ["//visibility:public"])

cc_toolchain_suite(
    name = "docker",
    toolchains = {
        "docker|gcc": "docker_toolchain",
    },
)

filegroup(
    name = "empty",
    srcs = [],
)

filegroup(
    name = "all",
    srcs = [
        "//toolchain/x86_64-linux-gcc:tool-wrappers",
        "@cross_toolchain//:all",
    ],
)

cc_toolchain(
    name = "docker_toolchain",
    all_files = ":all",
    compiler_files = ":all",
    cpu = "docker",
    dwp_files = ":empty",
    dynamic_runtime_libs = [":empty"],
    linker_files = ":all",
    objcopy_files = "//toolchain/x86_64-linux-gcc:objcopy",
    static_runtime_libs = [":empty"],
    strip_files = "//toolchain/x86_64-linux-gcc:strip",
    supports_param_files = 1,
    visibility = ["//visibility:public"],
)
