--==========================================================================================================================================================
--============================================================================================================================================== 
--==========================================================================================================================================================

set serveroutput on
begin
dbms_output.put_line('Hola Mundo');
end;
/

--==========================================================================================================================================================
--================================================================================================================================================== DECLARE
--==========================================================================================================================================================

DECLARE
v_myName VARCHAR(20);
BEGIN
DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
v_myName := 'John';
DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
END;
/

DECLARE
v_myName VARCHAR2(20):= 'John';
BEGIN
v_myName := 'Steven';
DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName);
END;
/

--==========================================================================================================================================================
--============================================================================================================================================== ???????
--==========================================================================================================================================================
variable x varchar(20)

--==========================================================================================================================================================
--================================================================================================================================================ FUNCTIONS
--==========================================================================================================================================================



--==========================================================================================================================================================
--============================================================================================================================================= Nested Bloke
--==========================================================================================================================================================

------------------------------------------------------------------------------------------------------------------ Variables Grobal


------------------------------------------------------------------------------------------------------------------ Variables Locales

------------------------------------------------------------------------------------------------------------------ Nombres de las blokes


--==========================================================================================================================================================
--============================================================================================================================================= Condenciones
--==========================================================================================================================================================




