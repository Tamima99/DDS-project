set serveroutput on;

DECLARE
   CURSOR seller_cur IS
      SELECT *
        FROM Seller_C@site_link
      UNION
      SELECT *
        FROM Seller_D;
BEGIN
   FOR seller_rec IN seller_cur LOOP
      DBMS_OUTPUT.PUT_LINE (seller_rec.SID || ' ' || seller_rec.Name);
   END LOOP;
END;
/



DECLARE
   CURSOR c1 IS
     SELECT *
     FROM Branch_C@site_link
     UNION
      SELECT *
      FROM Branch_D;
BEGIN
   FOR r1 IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE(r1.BranchID || ',' || r1.BranchName || ',' || r1.Phone || ',' || r1.Email || ',' || r1.Location);
   END LOOP;
END;
/