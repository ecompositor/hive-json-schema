SELECT   run_date,
         session_id,
         execution_id,
         account_id,
         product_number,
         csp_csp_gateway.mac,
         csp_csp_internet_service_details.tier.tierOfService as tier,
         download_speed as dl,
         csp_csp_internet_service_details.tier.uploadSpeed as ul,
         xsp_device_swaps.swaps_eligibility,
         xsp_device_swaps.raw_swaps_data.output.division,
         xsp_device_swaps.raw_swaps_data.output.region,
         xsp_device_swaps
FROM "ipieanalyticsandbox"."prod_speedtest"
WHERE (
 (run_date = '2018/08-27') OR
  (run_date = '2018/08-28') OR
  (run_date = '2018/08-29') OR
  (run_date = '2018/08-30') OR
  (run_date = '2018/08-31') OR
  (run_date = '2018/09-01') OR
  (run_date = '2018/09-02') OR
  (run_date = '2018/09-03') OR
 (run_date = '2018/09-04') ) AND account_id <> '-'
ORDER by run_date;
