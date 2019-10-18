

select pa.productid,ca.name,hn.name, an.name, group_concat(distinct pa.displayvalue SEPARATOR  ' | ') as attributevalue,
if (us.name='Hz' , pa.absolutevalue/group_concat(case when us.name='MHz' then us.multiple end ) ,
if (us.name='Byte' , pa.absolutevalue/group_concat(case when us.name='GB' then us.multiple end ) ,
if (us.name='MT/s' , pa.absolutevalue/group_concat(case when us.name='GT/s' then us.multiple end ) ,pa.absolutevalue))) as value
,if( un.name is NULL,'', if( un.name='Byte','GB',if( un.name='Hz','MHz',if( un.name='MT/s','GT/s',un.name)))) as unit
from categorydisplayattributes cda 
join productattribute pa on ( cda.categoryid=pa.categoryid and cda.attributeid=pa.attributeid and cda.isactive=pa.isactive)
join attributenames an on (pa.attributeid=an.attributeid and pa.localeid=an.localeid)
join categorynames ca on (cda.categoryid=ca.categoryid and an.localeid=ca.localeid)
join categoryheader ch on (cda.headerid=ch.headerid and cda.categoryid= ch.categoryid and cda.templatetype=ch.templatetype)
join headernames hn on (ch.headerid=hn.headerid and an.localeid=hn.localeid )
left join unitnames un on ( pa.unitid=un.unitid and pa.localeid=un.localeid)
left join units us on ( un.unitid=us.baseunitid )
where cda.categoryid=4876 and an.localeid=1 and pa.productid=1024203363  and cda.templatetype=1
group by cda.attributeid,us.baseunitid
order by ch.defaultdisplayorder, cda.defaultdisplayorder
;


select csa.attributeid, an.name, group_concat( distinct sav.value SEPARATOR  ' | ')
from categorysearchattributes csa 
join attributenames an on (csa.attributeid=an.attributeid)
join search_attribute sa on (an.attributeid=sa.attributeid and an.localeid=sa.localeid)
join search_attribute_values sav on (sa.valueid=sav.valueid)
where csa.categoryid=10143 and an.localeid=1
group by csa.attributeid;



select csa.attributeid, an.name, group_concat( pa.displayvalue SEPARATOR  ' | ')
from categorysearchattributes csa 
join productattribute pa on (csa.categoryid=pa.categoryid and csa.attributeid=pa.attributeid)
join attributenames an on (pa.attributeid=an.attributeid and pa.localeid=an.localeid )
where csa.categoryid=10143 and an.localeid=1  and pa.productid=1012963886
group by csa.attributeid
;





select cda.categoryid,cda.attributeid,an.name
from categorydisplayattributes cda 
join attributenames as an on (cda.attributeid=an.attributeid)
where an.localeid=1 and cda.templatetype=1 and cda.categoryid= 10143 ;

select csa.categoryid,csa.attributeid,an.name
from categorysearchattributes as csa
join attributenames as an on (csa.attributeid=an.attributeid)
where csa.categoryid=10143 and an.localeid=1;


