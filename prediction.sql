SET SERVEROUTPUT ON;
SET VERIFY OFF;

--Delete from difference_table1;
--@site1;
--Delete from difference_table2@site2;

--CREATE OR REPLACE FUNCTION absolute_value(A IN NUMBER, B IN NUMBER)
--RETURN NUMBER
--IS 
	--distance NUMBER;

--BEGIN
--	distance:=ABS(A - B);   
--	RETURN distance;
--END absolute_value;
--/


ACCEPT P NUMBER PROMPT "Enter your preferable memory in GigaByte: "
ACCEPT Q NUMBER PROMPT "Enter your preferable storage in GigaByte: "
ACCEPT R NUMBER PROMPT "Enter your preferable cpu_speed in Hz: "
ACCEPT S NUMBER PROMPT "Enter your preferable Battery in mAh: "
ACCEPT T NUMBER PROMPT "Enter your preferable Display Size in Inches: "
ACCEPT X NUMBER PROMPT "Enter Your Choice for Sorting 1.Memory 2.Storage 3.Battery 4.Price: "

DECLARE
	A number:=&P;
	B number:=&Q;
	C float:=&R;
	D number:=&S;
	E FLOAT:=&T;
	I number:=&X;
	--DECLARE
POPULAR_NOW ORDER_D.BRAND%TYPE;
		
	invalid_memory EXCEPTION;
	invalid_storage EXCEPTION;
	invalid_CPUSpeed EXCEPTION;
	invalid_Battery EXCEPTION;
	invalid_Display EXCEPTION;

BEGIN
	IF A>32 OR A<4 THEN
		RAISE invalid_memory;
	ELSIF B>2048 OR B<256 THEN
		RAISE invalid_storage;
	ELSIF C>4.5 OR C<2.8 THEN
		RAISE invalid_CPUSpeed;
	ELSIF D>99 OR D<31 THEN
		RAISE invalid_Battery;
	ELSIF E>15.6 OR E<14 THEN
		RAISE invalid_Display;
	END IF;
	
	IF A = 4 OR A = 8 THEN
		predict_laptop_site1.nearestNeighbours(A,B,C,D,E);
		
		CASE (I)
			WHEN 1 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Memory: ');	
				predict_laptop_site1.print_memory;
			WHEN 2 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Storage: ');	
				predict_laptop_site1.print_storage;
			WHEN 3 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Battery: ');	
				predict_laptop_site1.print_battery;
			WHEN 4 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Price: ');	
				predict_laptop_site1.print_price;
			ELSE
				DBMS_OUTPUT.PUT_LINE('YOU DONT HAVE A CHOICE');	
		END CASE;
		
	ELSIF A = 16 OR A = 32 THEN
	
		predict_laptop_site2.nearestNeighbours(A,B,C,D,E);
		
		CASE (I)
			WHEN 1 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Memory: ');	
				predict_laptop_site2.print_memory;
			WHEN 2 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Storage: ');	
				predict_laptop_site2.print_storage;
			WHEN 3 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Battery: ');	
				predict_laptop_site2.print_battery;
			WHEN 4 THEN
				DBMS_OUTPUT.PUT_LINE('Suggested Laptop For you according to Price: ');	
				predict_laptop_site2.print_price;
			ELSE
				DBMS_OUTPUT.PUT_LINE('YOU DONT HAVE A CHOICE');		
		END CASE;
		
	END IF;
	
	
		DBMS_OUTPUT.PUT_LINE('-----------------------');
		DBMS_OUTPUT.PUT_LINE('POPULAR_NOW');
		BEGIN
		
		FOR R IN (select brand from order_d group by brand) LOOP
		POPULAR_NOW:= R.BRAND;
		
		DBMS_OUTPUT.PUT_LINE(POPULAR_NOW);
		END LOOP;
		end;
		
	
			
	EXCEPTION
		WHEN invalid_memory THEN
			DBMS_OUTPUT.PUT_LINE('Invalid memory');
		WHEN invalid_storage THEN
			DBMS_OUTPUT.PUT_LINE('Invalid storage');
		WHEN invalid_CPUSpeed THEN
			DBMS_OUTPUT.PUT_LINE('Invalid CPU Clock Speed');	
		WHEN invalid_Battery THEN
			DBMS_OUTPUT.PUT_LINE('Invalid Battery Power');
		WHEN invalid_Display THEN
			DBMS_OUTPUT.PUT_LINE('Invalid Display Size');	
END;
/

commit;

