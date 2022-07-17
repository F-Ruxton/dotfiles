_found_imports = []
_unfound_imports = []

try:
    import pydantic

    _found_imports += ["pydantic"]
except ModuleNotFoundError:
    _unfound_imports.append("pydantic")

try:
    import dask
    import dask.dataframe as dd
    from dask.distributed import Client, LocalCluster

    _found_imports += ["dask"]
    _found_imports += ["dask.dataframe as dd"]
    _found_imports += ["dask.distributed.Client"]
    _found_imports += ["dask.distributed.LocalCluster"]
except ImportError:
    _unfound_imports.append("dask")

try:
    import cartopy.crs as ccrs

    _found_imports += ["cartopy.crs as ccrs"]
except ModuleNotFoundError:
    _unfound_imports.append("cartopy")

try:
    import holoviews as hv

    _found_imports += ["holoviews as hv"]
    import holoviews.operation.datashader as hd

    _found_imports += ["holoviews.operation.datashader as hd"]
    import colorcet as cc

    _found_imports += ["colorcet as cc"]

    hv.extension("bokeh")
except ModuleNotFoundError:
    _unfound_imports.append("holoviews")

try:
    import hvplot.pandas

    _found_imports += ["hvplot.pandas"]
    import hvplot.xarray

    _found_imports += ["hvplot.xarray"]
except ModuleNotFoundError:
    _unfound_imports.append("hvplot")

try:
    import geopandas as gpd

    _found_imports += ["geopandas as gpd"]
except ModuleNotFoundError:
    _unfound_imports.append("geopandas")

try:
    import geoviews as gv

    _found_imports += ["geoviews as gv"]
    import geoviews.feature as gf

    _found_imports += ["geoviews.feature as gf"]

    gv.extension("bokeh")
except ModuleNotFoundError:
    _unfound_imports.append("geoviews")

try:
    import matplotlib.pyplot as plt

    _found_imports += ["matplotlib.pyplot as plt"]
except ModuleNotFoundError:
    _unfound_imports.append("matplotlib")

try:
    import numpy as np

    _found_imports += ["numpy as np"]
except ModuleNotFoundError:
    _unfound_imports.append("numpy")

try:
    import pandas as pd

    _found_imports += ["pandas as pd"]
except ModuleNotFoundError:
    _unfound_imports.append("pandas")

try:
    import scipy

    _found_imports += ["scipy"]
except ModuleNotFoundError:
    _unfound_imports.append("scipy")

try:
    import xarray as xr

    _found_imports += ["xarray as xr"]
except ModuleNotFoundError:
    _unfound_imports.append("xarray")


print(f"Found:   {sorted(_found_imports)}")
print(f"Unfound: {sorted(_unfound_imports)}")
