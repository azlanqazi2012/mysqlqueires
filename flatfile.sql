
selec



















select 
p.productid,
ps1.name  as 'SKU Type' ,
ps1.sku as SKU,
pa1.localeid,
case when ps2.sku IS NULL then '' else ps2.sku end as 'Catalog Sku' ,
case when pa1.displayvalue IS NULL  then '' else pa1.displayvalue end  as 'Brand Name' ,
case when pa2.displayvalue IS NULL  then '' else pa2.displayvalue end as 'Product Type',
case when pa3.displayvalue IS NULL  then '' else pa3.displayvalue end  as 'Product Line',
case when pa4.displayvalue IS NULL  then '' else pa4.displayvalue end as 'Product Series',
pds1.description Desc1, 
pds2.description Desc2,
pds3.description Desc3,
case when pa5.displayvalue IS NULL  then '' else pa5.displayvalue end as 'Marketing Text / Sales Copy',
mc.categoryid as 'Sub Class Number',
mcn1.name as 'Sub Class Name',
mcn2.categoryid as 'Class Number',
mcn2.name as 'Class Name',
mcn3.categoryid as 'Department Number',
mcn3.name as 'Department Name',
mcn4.categoryid as 'Master Department Number',
mcn4.name as 'Master Department Name',
ps3.sku as UNSPSC,
pkw.keywords,
mf.manufacturerid 'Manufacturer ID',
mf.name 'Manufacturer Name',
case when pa6.displayvalue IS NULL  then '' else pa6.displayvalue end as 'Country Of Origin',
case when pa7.displayvalue IS NULL  then '' else pa7.displayvalue end as 'Recycled',
case when pa8.displayvalue IS NULL  then '' else pa8.displayvalue end  as 'Recycled_PCW',
case when pa9.displayvalue IS NULL  then '' else pa9.displayvalue end as 'Recycled Total',
case when pa10.displayvalue IS NULL  then '' else pa10.displayvalue end as 'Assembly Required',
concat('http://content.etilize.com/images/225/',pa1.productid,'.jpg') 'Image Type 225',
concat('http://content.etilize.com/images/75/',pa1.productid,'.jpg') 'Image Type 75'
from product p 
left join productattribute pa1 on p.productid=pa1.productid and pa1.attributeid=34113319 and pa1.localeid=26
left join productattribute pa2 on pa1.productid=pa2.productid  and pa1.localeid=pa2.localeid and pa2.attributeid=321100 
left join productattribute pa3 on pa1.productid=pa3.productid  and pa1.localeid=pa3.localeid and pa3.attributeid=3212389 
left join productattribute pa4 on pa1.productid=pa4.productid and pa1.localeid=pa4.localeid and pa4.attributeid=32112816 
left join productattribute pa5 on pa1.productid=pa5.productid and pa1.localeid=pa5.localeid and pa5.attributeid=321452 
left join productattribute pa6 on pa1.productid=pa6.productid  and pa1.localeid=pa6.localeid  and pa6.attributeid=3211113883
left join productattribute pa7 on pa1.productid=pa7.productid  and pa1.localeid=pa7.localeid and pa7.attributeid=3211114053 
left join productattribute pa8 on pa1.productid=pa8.productid and pa1.localeid=pa8.localeid and pa8.attributeid=3211114055
left join productattribute pa9 on pa1.productid=pa9.productid and pa1.localeid=pa9.localeid and pa9.attributeid=3211114054
left join productattribute pa10 on pa1.productid=pa10.productid and pa1.localeid=pa10.localeid  and pa10.attributeid=3211114056 
 join productskus ps1 on p.productid=ps1.productid and ps1.name='SPR Special Order' and ps1.localeid=26
left join productskus ps2 on p.productid=ps2.productid and ps2.name='SP Richards Catalog' and ps2.localeid=26
left join productdescriptions pds1 on p.productid=pds1.productid and pds1.localeid=26 and pds1.type=1
left join productdescriptions pds2 on p.productid=pds2.productid and pds2.localeid=26 and pds2.type=2
left join productdescriptions pds3 on p.productid=pds3.productid and pds3.localeid=26 and pds3.type=3
left join mapped_category as mc on pa1.productid=mc.productid
left join mapped_category_names mcn1 on mc.categoryid=mcn1.categoryid and mcn1.localeid=pa1.localeid
left join mapped_category_taxonomy mct1 on mc.categoryid=mct1.categoryid
left join mapped_category_names mcn2 on mct1.parentcategoryid=mcn2.categoryid and mcn2.localeid=pa1.localeid 
left join mapped_category_taxonomy mct2 on mct1.parentcategoryid=mct2.categoryid
left join mapped_category_names mcn3 on mct2.parentcategoryid=mcn3.categoryid and mcn3.localeid=pa1.localeid
left join mapped_category_taxonomy mct3 on mct2.parentcategoryid=mct3.categoryid
left join mapped_category_names mcn4 on mct3.parentcategoryid=mcn4.categoryid and mcn4.localeid=pa1.localeid
left join productskus ps3 on pa1.productid=ps3.productid and pa1.localeid=ps3.localeid and ps3.name='UNSPSC'
left join productkeywords pkw on pa1.productid=pkw.productid and pa1.localeid=pkw.localeid

left join manufacturer mf on p.manufacturerid=mf.manufacturerid;








 




-- select pa1.productid,pa1.attributeid,pa2.attributeid,pa3.attributeid,pa4.attributeid,pa5.attributeid,pa6.attributeid,pa7.attributeid,pa8.attributeid,pa9.attributeid,pa10.attributeid
-- from productattribute pa1
-- left join productattribute pa2 on pa1.productid=pa2.productid and pa1.categoryid=pa2.categoryid and pa1.localeid=pa2.localeid 
-- left join productattribute pa3 on pa2.productid=pa3.productid and pa2.categoryid=pa3.categoryid and pa2.localeid=pa3.localeid 
-- left join productattribute pa4 on pa3.productid=pa4.productid and pa3.categoryid=pa4.categoryid and pa3.localeid=pa4.localeid 
-- left join productattribute pa5 on pa4.productid=pa5.productid and pa4.categoryid=pa5.categoryid and pa4.localeid=pa5.localeid 
-- left join productattribute pa6 on pa5.productid=pa6.productid and pa5.categoryid=pa6.categoryid and pa5.localeid=pa6.localeid 
-- left join productattribute pa7 on pa6.productid=pa7.productid and pa6.categoryid=pa7.categoryid and pa6.localeid=pa7.localeid 
-- left join productattribute pa8 on pa7.productid=pa8.productid and pa7.categoryid=pa8.categoryid and pa7.localeid=pa8.localeid 
-- left join productattribute pa9 on pa8.productid=pa9.productid and pa8.categoryid=pa9.categoryid and pa8.localeid=pa9.localeid 
-- left join productattribute pa10 on pa9.productid=pa10.productid and pa9.categoryid=pa10.categoryid and pa9.localeid=pa10.localeid 


-- where pa1.attributeid=34113319 and pa2.attributeid=341100 and pa3.attributeid=3412389 and pa4.attributeid=34112816 and pa5.attributeid=341452
--  and pa6.attributeid=3411113883 and pa7.attributeid=3411114053 and pa8.attributeid=3411114055 and pa9.attributeid=3411114054 and pa10.attributeid=3411114056 and pa1.productid=11961422

























--  select ps1.productid, ps1.name as 'SKU Type', ps1.sku as SKU , ps1.localeid as LocaleId, if (ps2.name='SP Richards Catalog',ps2.sku,'') as 'Catalog Sku', 
-- group_concat(distinct case  when pa.attributeid=34113319 then pa.displayvalue  end) as 'Brand Name',
-- group_concat(distinct case  when pa.attributeid=341100 then pa.displayvalue  end) as 'Product Type',
-- group_concat(distinct case  when pa.attributeid=3412389 then pa.displayvalue else '' end) as 'Product Line',
-- group_concat(distinct case  when pa.attributeid=34112816 then pa.displayvalue end) as 'Product Series',
-- group_concat(distinct case  when pd.type=1 then pd.description  end) as 'Desc1',
-- group_concat(distinct case  when pd.type=2 then pd.description  end) as 'Desc2',
-- group_concat(distinct case  when pd.type=3 then pd.description  end) as 'Desc3',
-- group_concat(distinct case  when pa.attributeid=341452 then pa.displayvalue else ''  end) as 'Marketing Text / Sales Copy',
-- group_concat(distinct mc.categoryid) as 'Sub Class Number',
-- group_concat(distinct mcn1.name) as 'Sub Class Name',
-- group_concat(distinct mcn2.categoryid) as 'Class Number',

-- group_concat(distinct mcn2.name) as 'Class Name',
-- group_concat(distinct mcn3.categoryid) as 'Department Number',
-- group_concat(distinct mcn3.name) as 'Department Name',
-- group_concat(distinct mcn4.categoryid) as 'Master Department Number',
-- group_concat(distinct mcn4.name) as 'Master Department Name',
-- if (ps2.name='UNSPSC',ps2.sku,'') as 'UNSPSC',
-- pkw.keywords,
-- p.manufacturerid 'Manufacturer ID',
-- m.name as Manufacturer,
-- group_concat(distinct case  when pa.attributeid=3411113883 then pa.displayvalue  end) as 'Country Of Origin',
-- group_concat(distinct case  when pa.attributeid=3411114053 then pa.displayvalue  end) as 'Recycled',
-- group_concat(distinct case  when pa.attributeid=3411114055 then pa.displayvalue else '' end) as 'Recycled_PCW',
-- group_concat(distinct case  when pa.attributeid=3411114054 then pa.displayvalue else '' end) as 'Recycled Total',
-- group_concat(distinct case  when pa.attributeid=3411114056 then pa.displayvalue  end) as 'Assembly Required',
-- concat('http://content.etilize.com/images/225/',ps1.productid,'.jpg') 'Image Type 225',
-- concat('http://content.etilize.com/images/75/',ps1.productid,'.jpg') 'Image Type 75'

-- from productskus ps1
-- join productskus ps2 on ps1.productid=ps2.productid and ps1.localeid=ps2.localeid
-- join productattribute as pa on ps2.productid=pa.productid and ps2.localeid=pa.localeid
-- join productdescriptions as pd on pa.productid=pd.productid and pa.localeid=pd.localeid
-- join mapped_category as mc on pd.productid=mc.productid
-- join mapped_category_names mcn1 on mc.categoryid=mcn1.categoryid and mcn1.localeid=ps1.localeid
-- join mapped_category_taxonomy mct1 on mc.categoryid=mct1.categoryid
-- join mapped_category_taxonomy mct2 on mct1.parentcategoryid=mct2.categoryid
-- join mapped_category_taxonomy mct3 on mct2.parentcategoryid=mct3.categoryid

-- join mapped_category_names mcn2 on mct1.parentcategoryid=mcn2.categoryid and mcn2.localeid=ps1.localeid
-- join mapped_category_names mcn3 on mct2.parentcategoryid=mcn3.categoryid and mcn3.localeid=ps1.localeid
-- join mapped_category_names mcn4 on mct3.parentcategoryid=mcn4.categoryid and mcn4.localeid=ps1.localeid
-- join productkeywords pkw on pa.productid=pkw.productid and pa.localeid=pkw.localeid
-- join product p on pa.productid=p.productid and pa.categoryid=p.categoryid and pa.isactive=p.isactive
-- join manufacturer m on p.manufacturerid=m.manufacturerid
-- where ps1.name = 'SPR Special Order' and ps1.localeid=26  
-- group by pa.productid
-- limit 1

-- ;