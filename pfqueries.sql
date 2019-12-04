truncate table flatprice_consolidated;
insert into flatprice_consolidated SELECT 0,
itemid,
'SP Richards',
ALIAS,
VENDOR_NAME,
'',
0,
SELLPRICE,
SELLPRICE,
0,
'',
'',
'',
'',
''
FROM flatfile.price_file;
update flatprice_consolidated fp 
join spr_enhanced.productskus ps  ON ps.name=fp.DistributorName and ps.sku=fp.sku and ps.localeid=1
set fp.productid=ps.productid;

truncate table flatbestprice;
insert ignore into flatbestprice (Id ,  itemid,
productid,
DistributorName,
sku,
ManufacturerName,
MfgPartNo,
Cost,
MSRP,
RetailPrice,
Qty,
UPC,
ShipWeight,
ShipLength,
ShipWidth,
ShipHeight) 

select 0,itemid,
productid,
DistributorName,
sku,
ManufacturerName,
MfgPartNo,
Cost,
MSRP,
RetailPrice,
Qty,
UPC,
ShipWeight,
ShipLength,
ShipWidth,
ShipHeight
from flatprice_consolidated;

insert ignore into productcustomdata 
select fbp.Id,'meta_keyword', pk.keywords
from flatbestprice fbp
join spr_enhanced.productkeywords pk on fbp.productid=pk.productid and pk.localeid=1;

insert ignore into productcustomdata select distinct fbp.Id,'uom',pf.INVENTORY_UOM
from flatbestprice fbp
join price_file pf on fbp.itemid=pf.itemid
;


