--  SELECT  count(distinct t.productid)
--  FROM test t

--  join productimages_RC pi2 on t.productid=pi2.productid and cast(pi2.type as signed) >=1200

--  ;



SELECT  t.productid,if(pi.type is null,'No','Yes'),
if(pi.type is null,'',concat('http://content.etilize.com/',pi.type,'/',t.productid,'/index.html')) ,
if(pi2.type is null,'No','Yes'),
if(pi2.type is null,'',concat('http://content.etilize.com/images/1200','/',t.productid,'.jpg'))
FROM test t
left join productimages_RC pi on t.productid=pi.productid and pi.type='Tour'   
left join productimages_RC pi2 on t.productid=pi2.productid and cast(pi2.type as signed) =1300



;