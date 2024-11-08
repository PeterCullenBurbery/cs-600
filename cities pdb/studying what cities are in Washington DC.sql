SELECT
    *
FROM
    view_city
WHERE
    REGEXP_LIKE ( state,
                  (
                      SELECT DISTINCT
                          state
                      FROM
                          view_city
                      WHERE
                          REGEXP_LIKE
                          ( state,
                                      'Columbia'
                                      ,
                                      'i'
                                      )
                  ) );

SELECT
    city_normalized_without_extra_columns_id
FROM
    view_city
WHERE
    REGEXP_LIKE ( state,
                  (
                      SELECT DISTINCT
                          state
                      FROM
                          view_city
                      WHERE
                          REGEXP_LIKE
                          ( state,
                                      'Columbia'
                                      ,
                                      'i'
                                      )
                  ) );
update building set city_id=(  SELECT
    city_normalized_without_extra_columns_id
FROM
    view_city
WHERE
    REGEXP_LIKE ( state,
                  (
                      SELECT DISTINCT
                          state
                      FROM
                          view_city
                      WHERE
                          REGEXP_LIKE
                          ( state,
                                      'Columbia'
                                      ,
                                      'i'
                                      )
                  ) ));               