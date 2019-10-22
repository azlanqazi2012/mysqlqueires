-- select ch.defaultdisplayorder, cda.defaultdisplayorder,an.attributeid,pa.displayvalue
-- from categoryheader ch
-- join categorydisplayattributes cda on ch.categoryid=cda.categoryid and cda.templatetype=ch.templatetype and cda.headerid=ch.headerid and cda.templatetype=0
-- join attributenames an on cda.attributeid=an.attributeid and an.localeid=1
-- join productattribute pa on cda.attributeid=pa.attributeid and cda.categoryid=pa.categoryid and an.localeid=pa.localeid
-- where pa.productid=1013912417 and ch.headerid <> 35
-- order by ch.defaultdisplayorder, cda.defaultdisplayorder

Select 
categoryheader.defaultdisplayorder, categorydisplayattributes.defaultdisplayorder,attributenames.name,categorydisplayattributes.attributeid, productattribute.displayvalue
from categoryheader
inner join categorydisplayattributes on categoryheader.headerid = categorydisplayattributes.headerid 
and categoryheader.categoryid = categorydisplayattributes.categoryid
inner join productattribute on categorydisplayattributes.categoryid = productattribute.categoryid 
and categorydisplayattributes.attributeid = productattribute.attributeid
inner join attributenames on productattribute.attributeid = attributenames.attributeid
where categorydisplayattributes.templatetype = 0 and categoryheader.templatetype = 0 
and productattribute.productid = 1013912417 and attributenames.localeid = 1 and productattribute.localeid = 1 
and categoryheader.headerid <> 35
order by categoryheader.defaultdisplayorder, categorydisplayattributes.defaultdisplayorder;