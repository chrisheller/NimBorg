# You can override this logic by defining your own 
# version of this module called nimborg_python_settings.nim
# and defining that at compile time
# e.g. nim c -d:nimborg_python_settings my_nimborg_file.nim

proc getPythonDllName*() : string {.compileTime.} = 
  when defined(windows):
    # the new buffer protocol only exists since python 2.6
    result = "python(27|26).dll"
  elif defined(macosx):
    result = "libpython(2.7|2.6).dylib"
  else:
    const dllver = ".1"
    result = "libpython(2.7|2.6).so" & dllver

# This does nothing by default, but allows overriding if you
# want to override how the initial path is setup.
proc getInitialPythonPath*() : string =
  result = nil 

