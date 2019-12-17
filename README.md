    ogr2ogr -f GeoJSON PG:"dbname=hillsborough user=postgres" "/home/ubuntu/webfiles/hillsborough/hillsborough_census_blocks.geojson" -nln hillsborough_census_blocks -append

    shp2pgsql -c -D -s 4326 -i -I tl_2010_12057_bg10.shp > census_blocks.sql
    psql -d hillsborough -f census_blocks.sql

    ogr2ogr -f "PostgreSQL" PG:"dbname=hillsborough user=postgres" "/home/ubuntu/webfiles/hillsborough/hillsborough_census_blocks.geojson" -nln hillsborough_census_blocks -append


### This code helps you dump the database to a file
### then reinflate on the server side
```pg_dump --username=postgres --encoding=ISO88591 -f lidar_dmp.sql lidar```
```sudo -u postgres createdb lidar```
```sudo psql -U postgres lidar < lidar_dmp.sql```



### LAS convert options in Geoverse Convert Software
- New Jersey State Plane (NAD 1983 - 2011 Correction) projection in feed.  ESPG:6527
- output projection is blank
- 3 cm pixel
- Intensity value scale grayscale 0-65000. 
