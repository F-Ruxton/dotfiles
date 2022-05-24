c = get_config()

c.InteractiveShellApp.extensions = ["autoreload"]
c.InteractiveShellApp.exec_lines = ["%autoreload 2"]

c.InteractiveShellApp.exec_files = [
    "/Users/freddieruxton/.ipython/profile_default/imports.py",
]