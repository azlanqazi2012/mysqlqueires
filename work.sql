SELECT p.productid,
 case when ps.name='SPR Special Order' then ps.name,
case when ps.name='SPR Special Order' then ps.sku,
FROM product p 
join productskus ps on (p.productid=ps.productid)

where p.productid=11961410



;