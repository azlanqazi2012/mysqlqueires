SELECT mf.name 'Manufacturer Name',cn.name "Category Name",count(p.manufacturerid) "Product Count" 
FROM int_NA_ALL_CSV.product p
join manufacturer mf on p.manufacturerid=mf.manufacturerid
join categorynames cn on p.categoryid=cn.categoryid and cn.localeid=1
where p.isaccessory=0 and mf.name="Comtrol Corporation"
group by p.manufacturerid , p.categoryid

;