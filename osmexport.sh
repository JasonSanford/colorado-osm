#!/bin/bash

if [ ! -f colorado-latest.osm.pbf ]; then
curl -O http://download.geofabrik.de/north-america/us/colorado-latest.osm.pbf
fi

[ -f bike_shops.geojson ] && rm bike_shops.geojson
OSM_CONFIG_FILE=osmconf.ini ogr2ogr -f "GeoJSON" -where 'shop="bicycle"' bike_shops.geojson colorado-latest.osm.pbf points

[ -f bike_paths.geojson ] && rm bike_paths.geojson
OSM_CONFIG_FILE=osmconf.ini ogr2ogr -f "GeoJSON" -where 'highway="cycleway"' bike_paths.geojson colorado-latest.osm.pbf lines

[ -f light_rail.geojson ] && rm light_rail.geojson
OSM_CONFIG_FILE=osmconf.ini ogr2ogr -f "GeoJSON" -where 'railway="light_rail"' light_rail.geojson colorado-latest.osm.pbf lines

[ -f cafes.geojson ] && rm cafes.geojson
OSM_CONFIG_FILE=osmconf.ini ogr2ogr -f "GeoJSON" -where 'amenity="cafe"' cafes.geojson colorado-latest.osm.pbf points
