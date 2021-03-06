#!/bin/bash

if [ ! -f colorado-latest.osm.pbf ]; then
curl -O http://download.geofabrik.de/north-america/us/colorado-latest.osm.pbf
fi

[ -f bike_shops.geojson ] && rm bike_shops.geojson
OSM_CONFIG_FILE=osmconf_bike_shops.ini ogr2ogr -f "GeoJSON" -where 'shop="bicycle"' bike_shops.geojson colorado-latest.osm.pbf points

[ -f bike_paths.geojson ] && rm bike_paths.geojson
OSM_CONFIG_FILE=osmconf_base.ini ogr2ogr -f "GeoJSON" -where 'highway="cycleway"' bike_paths.geojson colorado-latest.osm.pbf lines

[ -f light_rail.geojson ] && rm light_rail.geojson
OSM_CONFIG_FILE=osmconf_light_rail.ini ogr2ogr -f "GeoJSON" -where 'railway="light_rail"' light_rail.geojson colorado-latest.osm.pbf lines

[ -f cafes.geojson ] && rm cafes.geojson
OSM_CONFIG_FILE=osmconf_base.ini ogr2ogr -f "GeoJSON" -where 'amenity="cafe"' cafes.geojson colorado-latest.osm.pbf points

[ -f b_cycle_stations.geojson ] && rm b_cycle_stations.geojson
OSM_CONFIG_FILE=osmconf_base.ini ogr2ogr -f "GeoJSON" -where 'amenity="bicycle_rental"' b_cycle_stations.geojson colorado-latest.osm.pbf points

[ -f light_rail_stations.geojson ] && rm light_rail_stations.geojson
OSM_CONFIG_FILE=osmconf_light_rail.ini ogr2ogr -f "GeoJSON" -where 'railway="station" and operator="RTD"' light_rail_stations.geojson colorado-latest.osm.pbf points

[ -f zoos.geojson ] && rm zoos.geojson
OSM_CONFIG_FILE=osmconf_zoos.ini ogr2ogr -f "GeoJSON" -where 'tourism="zoo"' zoos.geojson colorado-latest.osm.pbf points
