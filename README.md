# eTrex 10 - OSM Maps
 
Simple dockerized environment around [`mkgmap`](https://www.mkgmap.org.uk/) to generate OSM-based for the [Garmin eTrex 10](https://buy.garmin.com/fr-FR/FR/p/87768).

Based on http://gps.maroufi.net/etrex10map.shtml.

## Usage

```shell
make build      # Create the Docker image
make map        # Start the Docker image
cd maps         # Move to the shared folder
etrex10-mkgmap "My map title" ./osm_exported_data # Generate the gmapbmap.img for the eTrex 10
```