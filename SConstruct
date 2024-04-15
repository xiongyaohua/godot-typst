#!/usr/bin/env python
import os
import sys

libname = "libgdtypst"
projectdir = "demo"

env = SConscript("godot-cpp/SConstruct")

env["compiledb"] = False
env.Tool("compilation_db")
compilation_db = env.CompilationDatabase(
    env["compiledb_file"]
)
env.Alias("compiledb", compilation_db)


# For the reference:
# - CCFLAGS are compilation flags shared between C and C++
# - CFLAGS are for C-specific compilation flags
# - CXXFLAGS are for C++-specific compilation flags
# - CPPFLAGS are for pre-processor flags
# - CPPDEFINES are for pre-processor defines
# - LINKFLAGS are for linking flags

# tweak this if you want to use different folders, or more folders, to store your source code in.
env.Append(CPPPATH=["src/"])
env.Append(LIBS="godot_typst")
env.Append(LIBPATH="target/debug/")

sources = Glob("src/*.cpp")
sources += Glob("src/bridge/*.cpp")

file = ""

if env["platform"] == "macos":
    file = "{}.{}.{}.framework/{}.{}.{}".format(
            libname, env["platform"], env["target"], libname, env["platform"], env["target"]
        )
    library = env.SharedLibrary(
        "bin/{}".format(file),
        source=sources,
    )
elif env["platform"] == "ios":
    if env["ios_simulator"]:
        file = "{}.{}.{}.simulator.a".format(libname, env["platform"], env["target"])
        library = env.StaticLibrary(
            "bin/{}".format(file),
            source=sources,
            LIBS="godot_typst",
            LIBPATH="target/debug/"
        )
    else:
        file = "{}.{}.{}.a".format(libname, env["platform"], env["target"])
        library = env.StaticLibrary(
            "bin/{}".format(file),
            source=sources,
        )
else:
    file = "{}{}{}".format(libname, env["suffix"], env["SHLIBSUFFIX"])
    library = env.SharedLibrary(
        "bin/{}".format(file),
        source=sources,
    )

copy = env.InstallAs("{}/bin/{}".format(projectdir, file), library)

default_args = [library, compilation_db, copy]
Default(default_args)
