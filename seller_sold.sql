set serveroutput on;

create or replace function countsellersold(matchseller Seller_D.Name%TYPE)
  return number
  is
  
  totalsells number;

begin
	
	 select count(pid) into totalsells from laptop
	 where SID in ( select SID from Seller_D where Name = matchseller);
	 
	return totalsells;

end countsellersold;
/

declare

    name Seller_D.Name%TYPE := '&SellerName';
	res number;
	
begin

	res := countsellersold(name);
	dbms_output.put_line('Total sold ' ||name|| ' = '||res);
	
end;
/