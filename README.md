### Import GeoJSON into PostGIS database
    ogr2ogr -f GeoJSON PG:"dbname=hillsborough user=postgres" "/home/ubuntu/webfiles/hillsborough/hillsborough_census_blocks.geojson" -nln hillsborough_census_blocks -append

### Import GeoGSON into PostGIS database
    ogr2ogr -f "PostgreSQL" PG:"dbname=hillsborough user=postgres" "/home/ubuntu/webfiles/hillsborough/hillsborough_census_blocks.geojson" -nln hillsborough_census_blocks -append

### Convert shape file into sql statement and import into PostGIS database
    shp2pgsql -c -D -s 4326 -i -I tl_2010_12057_bg10.shp > census_blocks.sql
    psql -d hillsborough -f census_blocks.sql

### This code helps you dump the database to a file
    pg_dump --username=postgres --encoding=ISO88591 -f lidar_dmp.sql lidar
    sudo -u postgres createdb lidar```

### Reinflate on the server side
    sudo psql -U postgres lidar < lidar_dmp.sql

### LAS convert options in Geoverse Convert Software
- New Jersey State Plane (NAD 1983 - 2011 Correction) projection in feed. [ESPG:6527](https://epsg.io/6527)
- output projection is blank
- 3 cm pixel
- Intensity value scale grayscale 0-65000.
- Render directions seperately (they are not registered together).

### Assumed Mission Folder Setup (sample)
    |_CR634
        |_BASE
            |_ LAS
                |_ trajectory_eb.las
                |_ trajectory_wb.las
            |_ GOPRO
                |_ CR634
                    |_ FRONT LEFT
                    |_ FRONT RIGHT
                    |_ REAR RIGHT
                    |_ REAR LEFT                
            |_ UDS
                |_ merged_las.uds
