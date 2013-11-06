;+
; NAME:
;   random_lonlat
;
; PURPOSE:
;   generate a sample of coordinates uniformly distributed on sphere
;
; CALLING SEQUENCE:
;   coords = random_lonlat(nsam, lrange=, brange=, seed=, double=, deg=)
;
; INPUTS:
;   nsam - number of random locations
;
; OPTIONAL INPUTS:
;   lrange - [lmin, lmax], boundaries in longitude, not yet implemented
;   brange - [bmin, bmax], boundaries in latitude, not yet implemented
;   seed   - optionally specify random sequence initialization seed
;
; KEYWORDS:
;   double - if set, do everything at double precision
;   deg    - return output (lon,lat) values in degrees, default radians
;
; OUTPUTS:
;   coords - [2, nsam] array containing nsam (lon, lat) pairs, 
;            [0, *] gives longitudes, [1, *] gives latitudes
;
; OPTIONAL OUTPUTS:
;   
; EXAMPLES:
;   
; COMMENTS:
;
; REVISION HISTORY:
;   2013-Nov-2 - Aaron Meisner
;----------------------------------------------------------------------
function random_lonlat, nsam, lrange=lrange, brange=brange, seed=seed, $ 
                        double=double, deg=deg

  if ~keyword_set(seed) then seed = 5L
  lon = !dpi*2.0d*randomu(seed, nsam, double=double)
  coslat = 2.0d*randomu(seed, nsam, double=double)-1.0d
  lat = acos(coslat)-!dpi/2.0d

  coords = keyword_set(double) ? dblarr(2, nsam) : fltarr(2, nsam)
  coords[0, *] = lon
  coords[1, *] = lat

  if keyword_set(deg) then begin
      radeg = 180.d/!dpi ; need this to be double
      coords *= radeg
  endif

  return, coords
end
