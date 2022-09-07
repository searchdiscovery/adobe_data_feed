/*
    The query will show the number of visitors for each site section.
    The sum of visitors will be higher compared to total unique visitor
    for the report suite
*/
select
    to_date(date_time) as date,
    username as report_suite,
    count(distinct concat(post_visid_high, post_visid_low)) as visitors
from ADOBE_HITS_FACT
where
    exclude_hit = 0
    and username = 'your_report_suite_id'
    and date = '2022-09-07'
group by 1,2,3
order by visitors desc;



/*
    The query will show number of unique visitors (deduplicated)
    for the whole report suite
*/
select
    to_date(date_time) as date,
    username as report_suite,
    -- channel as site_section,
    count(distinct concat(post_visid_high, post_visid_low)) as visitors
from ADOBE_HITS_FACT
where
    exclude_hit = 0
    and username = 'your_report_suite_id'
    and date = '2022-09-07'
group by 1,2,3
order by visitors desc;
