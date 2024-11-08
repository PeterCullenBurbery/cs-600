SELECT
    *
FROM
    view_city
WHERE
    REGEXP_LIKE ( city,
                  '^Huntington$',
                  'i' );