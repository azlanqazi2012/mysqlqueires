SELECT t.sku, ps.productid,p.mfgpartno,pa.displayvalue, pd.description as 'Type 1',pd2.description as 'Type 2',pd3.description as 'Type 3'
FROM sprenhanced.tests t
left join productskus ps on t.sku=ps.sku and ps.localeid=1 
left join product p on ps.productid=p.productid
left join productattribute pa on  ps.productid=pa.productid and pa.localeid=1 and pa.attributeid=32113319
left join productdescriptions pd on ps.productid=pd.productid and pd.localeid=1 and pd.type=1
left join productdescriptions pd2 on ps.productid=pd2.productid and pd2.localeid=1 and pd2.type=2
left join productdescriptions pd3 on ps.productid=pd3.productid and pd3.localeid=1 and pd3.type=3


;