import functools

print("imported functools")
import json

print("imported json")
import os

print("imported os")
from pathlib import Path

print("imported pathlib.Path")
from typing import (
    Any,
    Callable,
    Dict,
    List,
    Iterator,
    Optional,
    Tuple,
    Type,
    TypeVar,
    Union,
    Sized,
    Generator,
)

print("imported types")


try:
    import attr

    print("imported attr")
except ModuleNotFoundError as e:
    print(e)

try:
    import dask.dataframe as dd

    print("imported dask.dataframe as dd")
except ModuleNotFoundError as e:
    print(e)

try:
    import cartopy.crs as ccrs

    print("imported cartopy.crs as ccrs")
except ModuleNotFoundError as e:
    print(e)

try:
    import holoviews as hv

    print("imported holoviews as hv")
    import holoviews.operation.datashader as hd

    print("imported holoviews.operation.datashader as hd")
    import colorcet as cc

    print("imported colorcet as cc")

    hv.extension("bokeh")
except ModuleNotFoundError as e:
    print(e)

try:
    import hvplot.pandas

    print("imported hvplot.pandas")
    import hvplot.xarray

    print("imported hvplot.xarray")
except ModuleNotFoundError as e:
    print(e)

try:
    import geopandas as gpd

    print("imported geopandas as gpd")
except ModuleNotFoundError as e:
    print(e)

try:
    import geoviews as gv

    print("imported geoviews as gv")
    import geoviews.feature as gf

    print("imported geoviews.feature as gf")

    gv.extension("bokeh")
except ModuleNotFoundError as e:
    print(e)

try:
    import matplotlib.pyplot as plt

    print("imported matplotlib.pyplot as plt")
except ModuleNotFoundError as e:
    print(e)

try:
    import numpy as np

    print("imported numpy as np")
except ModuleNotFoundError as e:
    print(e)

try:
    import pandas as pd

    print("imported pandas as pd")
except ModuleNotFoundError as e:
    print(e)

try:
    import scipy

    print("imported scipy")
except ModuleNotFoundError as e:
    print(e)

try:
    import xarray as xr

    print("imported xarray as xr")
except ModuleNotFoundError as e:
    print(e)
