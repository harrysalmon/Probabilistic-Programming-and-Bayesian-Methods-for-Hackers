select browser_id
	, case when min_by(location_country_code, event_timestamp) in ('GB', 'US', 'AU') 
		then min_by(location_country_code, event_timestamp) else 'ROW' end as country
  , count(*) as page_views
from clean.pageviews as p
where date >= date '2016-08-15'
  and date < date '2016-08-22'
group by 1;

