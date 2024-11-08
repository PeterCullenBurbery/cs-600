UPDATE city_normalized cn
SET
    normalized_state_id = (
        SELECT
            s.state_id
        FROM
            state s
        WHERE
            s.state = cn.state_name
    )
WHERE
    EXISTS (
        SELECT
            1
        FROM
            state s
        WHERE
            s.state = cn.state_name
    );

UPDATE city_normalized cn
SET
    county_id = (
        SELECT
            c.county_id
        FROM
            county c
        WHERE
            c.county_fips = cn.county_fips
    )
WHERE
    EXISTS (
        SELECT
            1
        FROM
            county c
        WHERE
            c.county_fips = cn.county_fips
    );

ALTER TABLE city_normalized_without_extra_columns ADD county_id RAW(16)
    REFERENCES county ( county_id );

UPDATE city_normalized_without_extra_columns cn
SET
    county_id = (
        SELECT
            c.county_id
        FROM
            county c
        WHERE
            c.county_fips = cn.county_fips
    )
WHERE
    EXISTS (
        SELECT
            1
        FROM
            county c
        WHERE
            c.county_fips = cn.county_fips
    );