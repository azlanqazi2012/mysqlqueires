select productid,
group_concat(case when name='UPC' then sku end ) as UPC,
group_concat(case when name='GTIN' then sku end) as GTIN,
group_concat(case when name='UNSPSC' then sku end) as UNSPSC

from productskus
where productid=1048687160 and localeid=1
group by productid

