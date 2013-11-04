"""
Generate a sample of coordinates uniformly distributed on sphere.

"""
import numpy as np

def random_lonlat(nsam, lrange=0., brange=0., seed=5, deg=False):
    """
    Project points from longitude and latitude to a gnomic projection.

    Inputs:
        nsam  - number of random locations

    Outputs:
        lon   - array of longitude coordinates
        lat   - array of latitude coordinates

    Keywords:
        seed  - random sequence initialization seed
        deg   - if True ,return coordinates in degrees, default radians

    Comments:
       lrange, brange keywords not yet implemented
    """
    np.random.seed(seed=seed)
    lon = 2.*np.pi*np.random.rand(nsam)
    coslat = 2.*np.random.rand(nsam)-1.
    lat = np.arccos(coslat)- np.pi/2

    if deg:
        lon *= 180./np.pi
        lat *= 180./np.pi
    
    return lon, lat
