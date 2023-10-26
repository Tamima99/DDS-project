DECLARE
  CURSOR customer_cursor IS
    SELECT CID, SUM(Price) AS Total
    FROM Order_D
    JOIN laptop ON Order_D.pid = laptop.pid
    GROUP BY CID
    ORDER BY Total DESC;

  customer_record customer_cursor%ROWTYPE;
  counter INT := 0;
BEGIN
  OPEN customer_cursor;
  LOOP
    FETCH customer_cursor INTO customer_record;
    EXIT WHEN customer_cursor%NOTFOUND;
    counter := counter + 1;
    DBMS_OUTPUT.PUT_LINE(customer_record.CID || ' ordered ' || customer_record.Total);
    IF counter = 5 THEN
      EXIT;
    END IF;
  END LOOP;
  CLOSE customer_cursor;
END;
/
