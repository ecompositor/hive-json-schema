CREATE EXTERNAL TABLE `model_posterior`(
  `job_id` bigint,
  `model_id` bigint,
  `parents` array<struct<`feature_name`:string,`feature_value`:bigint, `is_zid`:boolean>>,
  `posterior_samples` struct <`parameter`:string,`is_scaled`:boolean,`samples`:array<double>>)


WITH samples AS (
    SELECT model_id, parents, sample, sample_index
    FROM posterior_db.model_posterior
    CROSS JOIN UNNEST(posterior_samples.samples) WITH ORDINALITY AS t (sample, sample_index)
    WHERE job_id = 111000020709
)
SELECT * FROM samples

WITH home_outages AS (
    SELECT run_date, account_id, home_outages, home_outages_index
    FROM "ipieanalyticsandbox"."prod_speedtest"
    CROSS JOIN UNNEST(csp_csp_outages.home.outages) WITH ORDINALITY AS t(descripion, description_index)
    WHERE run_date = '2018/09-04'
    ORDER BY account_id DESC
    LIMIT 10
)

SELECT * FROM home_outages

 `csp_csp_outages`
    struct<`home`:struct<
      `outages`:array<struct<
        `description`:string,
        `enddatetime`:string,
        `enddatetimeinmillis`:int,
        `estimatedresolutiondatetime`:string,
        `estimatedresolutiondatetimeinmillis`:int, `id`:string, `linklabel`:string, `linkurl`:string, `outagetype`:string, `priority`:string, `startdatetime`:string, `startdatetimeinmillis`:int, `ticketnumber`:string, `title`:string>>>, `internet`:struct<`outages`:array<struct<`description`:string, `enddatetime`:string, `enddatetimeinmillis`:int, `estimatedresolutiondatetime`:string, `estimatedresolutiondatetimeinmillis`:int, `id`:string, `linklabel`:string, `linkurl`:string, `outagetype`:string, `priority`:string, `startdatetime`:string, `startdatetimeinmillis`:int, `ticketnumber`:string, `title`:string>>>, `status`:string, `statustime`:string, `statustimeinmillis`:double, `video`:struct<`outages`:array<struct<`description`:string, `enddatetime`:string, `enddatetimeinmillis`:int, `estimatedresolutiondatetime`:string, `estimatedresolutiondatetimeinmillis`:int, `id`:string, `linklabel`:string, `linkurl`:string, `outagetype`:string, `priority`:string, `startdatetime`:string, `startdatetimeinmillis`:int, `ticketnumber`:string, `title`:string>>>, `voice`:struct<`outages`:array<struct<`description`:string, `enddatetime`:string, `enddatetimeinmillis`:int, `estimatedresolutiondatetime`:string, `estimatedresolutiondatetimeinmillis`:int, `id`:string, `linklabel`:string, `linkurl`:string,
  `outagetype`:string, `priority`:string, `startdatetime`:string, `startdatetimeinmillis`:int, `ticketnumber`:string, `title`:string>>>>