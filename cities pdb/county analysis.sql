SELECT DISTINCT
    county_fips,
    county_name
FROM
    city_normalized_without_extra_columns;

SELECT DISTINCT
    county_fips,
    county_name
FROM
    city_normalized_without_extra_columns
ORDER BY
    county_fips ASC;

SELECT
    COUNT(DISTINCT county_fips)
FROM
    city_normalized_without_extra_columns;

SELECT
    COUNT(DISTINCT county_name)
FROM
    city_normalized_without_extra_columns;

SELECT
    county_name,
    COUNT(county_name)
FROM
    city_normalized_without_extra_columns
GROUP BY
    county_name
HAVING
    COUNT(county_name) >= 2
ORDER BY
    COUNT(county_name) DESC;

SELECT
    county_name,
    COUNT(county_name)
FROM
    city_normalized_without_extra_columns
GROUP BY
    county_name
HAVING
    COUNT(county_name) >= 2
ORDER BY
    COUNT(county_name) DESC
FETCH FIRST 1 ROWS ONLY;

SELECT
    county_fips,
    county_name
FROM
    us_city
WHERE
    REGEXP_LIKE ( county_name,
                  (
                      SELECT
                          county_name
                      FROM
                          city_normalized_without_extra_columns
                      GROUP BY
                          county_name
                      HAVING
                          COUNT(county_name) >= 2
                      ORDER BY
                          COUNT(county_name) DESC
                      FETCH FIRST 1 ROWS ONLY
                  ),
                  'i' )
ORDER BY
    county_fips ASC;

SELECT DISTINCT
    county_fips,
    county_name
FROM
    us_city
WHERE
    REGEXP_LIKE ( county_name,
                  (
                      SELECT
                          county_name
                      FROM
                          city_normalized_without_extra_columns
                      GROUP BY
                          county_name
                      HAVING
                          COUNT(county_name) >= 2
                      ORDER BY
                          COUNT(county_name) DESC
                      FETCH FIRST 1 ROWS ONLY
                  ),
                  'i' )
ORDER BY
    county_fips ASC;
INSERT INTO COUNTY(COUNTY_FIPS,COUNTY)
SELECT DISTINCT
    county_fips,
    county_name
FROM
    city_normalized_without_extra_columns
ORDER BY
    county_fips ASC;