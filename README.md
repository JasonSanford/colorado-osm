## Colorado OSM

A set of scripts that takes a planet OSM file, in this case just Colorado, and converts features with specific tags (or sets of tags) to GeoJSON.

## Requirements

* GDAL / OGR - A new-ish version of ogr2ogr is needed to be able to parse both GeoJSON and OSM data.

## Running

    ./osmexport.sh

If the `colorado-latest.osm.pbf` file isn't found, it is `CURL`'d from the [Geofabrik download site](http://download.geofabrik.de/).
