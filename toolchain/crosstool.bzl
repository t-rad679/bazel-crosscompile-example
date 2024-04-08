load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "action_config",
    "artifact_name_pattern",
    "env_entry",
    "env_set",
    "feature",
    "feature_set",
    "flag_group",
    "flag_set",
    "make_variable",
    "tool",
    "tool_path",
    "variable_with_value",
    "with_feature_set",
)
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

def _impl(ctx):
    toolchain_identifier = "docker_toolchain"

    host_system_name = "local"

    target_system_name = "docker-unknown-linux-gnu"

    target_cpu = "docker"

    target_libc = "unknown"

    compiler = "gcc"

    abi_version = "gcc"

    abi_libc_version = "unknown"

    cc_target_os = None

    all_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.clif_match,
        ACTION_NAMES.lto_backend,
    ]

    all_cpp_compile_actions = [
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.clif_match,
    ]

    preprocessor_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.clif_match,
    ]

    codegen_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.lto_backend,
    ]

    all_link_actions = [
        ACTION_NAMES.cpp_link_executable,
        ACTION_NAMES.cpp_link_dynamic_library,
        ACTION_NAMES.cpp_link_nodeps_dynamic_library,
    ]

    action_configs = []

    features = []

    cxx_builtin_include_directories = [
            "%package(@@cross_toolchain//lib/gcc/aarch64_be-none-linux-gnu/13.2.1)%",
        ]

    artifact_name_patterns = []

    make_variables = []

    tool_paths = [
        tool_path(
            name = "gcc",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-gcc",
        ),
        tool_path(
            name = "ld",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-ld",
        ),
        tool_path(
            name = "ar",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-ar",
        ),
        tool_path(
            name = "cpp",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-cpp",
        ),
        tool_path(
            name = "gcov",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-gcov",
        ),
        tool_path(
            name = "nm",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-nm",
        ),
        tool_path(
            name = "objdump",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-objdump",
        ),
        tool_path(
            name = "strip",
            path = "aarch64_be-none/aarch64_be-none-linux-gnu-strip",
        ),
    ]


    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(out, "Fake executable")
    return [
        cc_common.create_cc_toolchain_config_info(
            ctx = ctx,
            features = features,
            action_configs = action_configs,
            artifact_name_patterns = artifact_name_patterns,
            cxx_builtin_include_directories = cxx_builtin_include_directories,
            toolchain_identifier = toolchain_identifier,
            host_system_name = host_system_name,
            target_system_name = target_system_name,
            target_cpu = target_cpu,
            target_libc = target_libc,
            compiler = compiler,
            abi_version = abi_version,
            abi_libc_version = abi_libc_version,
            tool_paths = tool_paths,
            builtin_sysroot = "external/cross_toolchain/libexec/gcc/aarch64_be-none-linux-gnu/13.2.1",
            make_variables = make_variables,
            cc_target_os = cc_target_os
        ),
        DefaultInfo(
            executable = out,
        ),
    ]
cc_toolchain_config =  rule(
    implementation = _impl,
    attrs = {
        "cpu": attr.string(mandatory=True, values=["docker"]),
    },
    provides = [CcToolchainConfigInfo],
    executable = True,
)
