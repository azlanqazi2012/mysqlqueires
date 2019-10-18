-- Bread Crump
SELECT p.productid,
concat(case when ct5.categoryid is null or ct5.categoryid=1 then '' else concat(cn5.name,'/')   end,
 case when ct4.categoryid is null or ct4.categoryid=1 then '' else concat(cn4.name,'/') end,
 case when ct3.categoryid is null or ct3.categoryid=1 then '' else concat(cn3.name,'/') end,
 case when ct2.categoryid is null or ct2.categoryid=1 then '' else concat(cn2.name,'/') end,
 case when ct1.categoryid is null or ct1.categoryid=1 then '' else concat(cn1.name,'/') end
 ) as BreadCrump
FROM product p
join category ct1 on p.categoryid=ct1.categoryid 
join category ct2 on ct1.parentcategoryid=ct2.categoryid
join category ct3 on ct2.parentcategoryid=ct3.categoryid
join category ct4 on ct3.parentcategoryid=ct4.categoryid
join category ct5 on ct4.parentcategoryid=ct5.categoryid

join categorynames cn1 on ct1.categoryid=cn1.categoryid
join categorynames cn2 on ct2.categoryid=cn2.categoryid and cn1.localeid=cn2.localeid
join categorynames cn3 on ct3.categoryid= cn3.categoryid and cn1.localeid=cn3.localeid
join categorynames cn4 on ct4.categoryid=cn4.categoryid and cn1.localeid=cn4.localeid
join categorynames cn5 on ct5.categoryid=cn5.categoryid and cn1.localeid= cn5.localeid
;




