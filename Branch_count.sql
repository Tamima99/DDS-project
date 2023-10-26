set serveroutput on;

create or replace procedure countbranchcustomer(
		matchbranchname in Branch_D.BranchName%TYPE, totalCustomer in out number )
		IS	
	
begin  

	select count(CID) into totalCustomer from Customer_D
	 where BranchID in ( select BranchID from Branch_D where BranchName = matchbranchname);
	 
	 
end countbranchcustomer;
/
declare
    name Branch_D.BranchName%TYPE := '&BranchName';
	res number:=0;
begin
	
	countbranchcustomer(name,res);
	dbms_output.put_line('Total Customer ' ||name|| ' = '||res);

end;
/