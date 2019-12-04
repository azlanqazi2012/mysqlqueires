SELECT p.productid,
 case when ps.name='SPR Special Order' then ps.name end,
case when ps.name='SPR Special Order' then ps.sku end
FROM product p 
join productskus ps on (p.productid=ps.productid)

where p.productid=11961410



;