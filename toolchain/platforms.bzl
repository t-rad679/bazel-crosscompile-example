constraint_value(
    name = "docker",
    constraint_setting = "@platforms//cpu",
)

platform(
    name = "docker_platform",
    constraint_values = [":docker"],
)

