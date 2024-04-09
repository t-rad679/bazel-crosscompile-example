package(default_visibility = ["//visibility:public"])

load(":crosstool.bzl", "cc_toolchain_config")

cc_toolchain_suite(
    name = "docker_toolchain_suite",
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
        "//toolchain/aarch64_be-none:tool-wrappers",
        "@cross_toolchain//:all",
    ],
)

cc_toolchain_config(
    name = "docker_toolchain_config",
    cpu = "docker",
)

cc_toolchain(
    name = "docker_cc_toolchain",
    all_files = ":all",
    compiler_files = ":all",
    dwp_files = ":empty",
    dynamic_runtime_lib = ":empty",
    linker_files = ":all",
    objcopy_files = "//toolchain/aarch64_be-none:objcopy",
    static_runtime_lib = ":empty",
    strip_files = "//toolchain/aarch64_be-none:strip",
    supports_param_files = 1,
    toolchain_config = ":docker_toolchain_config",
    visibility = ["//visibility:public"],
)

toolchain(
    name = "docker_toolchain",
    toolchain = ":docker_cc_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    target_compatible_with = [
        ":docker",
    ],
)
constraint_value(
    name = "docker",
    constraint_setting = "@platforms//cpu",
)

platform(
    name = "docker_platform",
    constraint_values = [":docker"],
)
