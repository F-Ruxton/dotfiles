import functools
import json
import os
import sys
from pathlib import Path

try:
    from typing import (Any, Callable, Dict, Generator, Iterator, List,
                        Optional, Sized, Tuple, Type, TypeVar, Union)
except ModuleNotFoundError as e:
    print(e)


HOME = Path(os.environ["HOME"])


EXTRA_IMPORTS_PATH = HOME / ".ipython/profile_default/extra_imports.py"
sys.path.insert(1, str(EXTRA_IMPORTS_PATH))


print("To load extras: from extra_imports import *")
