cc_library(
    name = "zlib.c",
    srcs = [":z"],
    hdrs = glob(["*.h"]),
    includes = ["."],
    linkstatic = 1,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "z",
    srcs = glob(["*.c"]),
    hdrs = glob(["*.h"]),
    copts = ["-Wno-implicit-function-declaration"],
)
