	
SELECT p.productid,
CONCAT(CASE WHEN tn5.name IS NULL OR tn5.categoryid = 1 THEN ' ' ELSE CONCAT(tn5.name,' / ') END,
CASE WHEN tn4.name IS NULL OR tn4.categoryid = 1 THEN ' ' ELSE CONCAT(tn4.name,' / ') END,
CASE WHEN tn3.name IS NULL OR tn3.categoryid = 1 THEN ' ' ELSE CONCAT(tn3.name,' / ') END,
CASE WHEN tn2.name IS NULL OR tn2.categoryid = 1 THEN ' ' ELSE CONCAT(tn2.name,' / ') END,
CASE WHEN tn1.name IS NULL OR tn1.categoryid = 1 THEN ' ' ELSE CONCAT(tn1.name) END) AS 'Category Tree'
FROM product p 
JOIN category t1 ON p.categoryid = t1.categoryid
JOIN category AS t2 ON t2.categoryid = t1.parentcategoryid
JOIN category AS t3 ON t3.categoryid = t2.parentcategoryid
JOIN category AS t4 ON t4.categoryid = t3.parentcategoryid
JOIN category AS t5 ON t5.categoryid = t4.parentcategoryid
JOIN categorynames AS tn1 ON tn1.categoryid = t1.categoryid AND tn1.`localeid`=1
JOIN categorynames AS tn2 ON tn2.categoryid = t2.categoryid AND tn2.`localeid`=1
JOIN categorynames AS tn3 ON tn3.categoryid = t3.categoryid AND tn3.`localeid`=1
JOIN categorynames AS tn4 ON tn4.categoryid = t4.categoryid AND tn4.`localeid`=1
JOIN categorynames AS tn5 ON tn5.categoryid = t5.categoryid AND tn5.`localeid`=1
JOIN manufacturer AS mfg ON mfg.manufacturerid = p.manufacturerid
 where p.productid=1059281117 ;