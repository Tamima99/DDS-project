
--DECLARE
  --CURSOR brand_cursor IS
select brand AS PopularNow 
  from order_d 
 group by brand ;
 --order by ct desc ; 
 --limit 5;
 
 
 --brand_cursor brand_cursor%ROWTYPE;
  --c INT := 0;
  
  --BEGIN
  --OPEN brand_cursor;
  --LOOP
    --FETCH brand_cursor INTO brand_cursor;
    --EXIT WHEN brand_cursor%NOTFOUND;
    --counter := counter + 1;
	 --   DBMS_OUTPUT.PUT_LINE('Most Popular Brand');
 --   DBMS_OUTPUT.PUT_LINE(brand_cursor.brand);
    --IF counter = 5 THEN
      --EXIT;
    --END IF;
 -- END LOOP;
 -- CLOSE brand_cursor;
--END;
--/
