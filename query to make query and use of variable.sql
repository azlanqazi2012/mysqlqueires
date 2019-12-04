SET @cnt=0;
SELECT (@cnt := @cnt + 1) 'Ruleid',concat("Select productid, 'Custom_Mapping', '",categorystructure,"' from productattribute where categoryid = ",categoryid ," and attributeid = 32",attributeid ," and displayvalue in (",group_concat("'",displayvalue,"'") ,") and localeid = 1;") 'Query'
,categoryid,attributeid,
categorystructure FROM na_samplecsv.query
--  CROSS JOIN (SELECT @cnt := 0) AS dummy
where attributeid2 ='' 
group by categoryid,attributeid,attributeid2,categorystructure

;

Select productid, 'Custom_Mapping', 'Printers, Scanners & Print Supplies > Dot-Matrix Printers' from productattribute where categoryid = 4805 and attributeid = 321100 and displayvalue in ('Dot Matrix Printer') and localeid = 1;