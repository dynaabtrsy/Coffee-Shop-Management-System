-- FUNCTION 1: Get final amount by adding 6% tax for each order id inserted.
CREATE OR REPLACE FUNCTION get_final_total_by_order (p_order_id IN INT)
RETURN NUMBER
IS
 v_total_amount NUMBER(10,2);
 v_tax NUMBER(10,2):=0.06;
 v_final_amount NUMBER(10,2);
BEGIN
 DBMS_OUTPUT.PUT_LINE('--- Function: Getting Final Total Including Tax for Order
ID: ' || p_order_id || ' ---');
 SELECT subtotal
 INTO v_total_amount
 FROM ORDERDETAIL
 WHERE ORDERID = p_order_id;

 v_final_amount := ROUND(v_total_amount*(1+v_tax),2);
 RETURN v_final_amount; -- Return the calculated count
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 RETURN 0;
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('An error occurred in the function: ' || SQLERRM);
 RETURN -1;
END;
/

-- Anonymous Block for Function 1:
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT ORDERID PROMPT 'Enter Order ID: '
DECLARE
v_order_id orderdetail.orderid%type := &orderid;
v_taxed_amount NUMBER(10,2);
BEGIN
v_taxed_amount := get_final_total_by_order(p_order_id => v_order_id);
dbms_output.put_line('Order ID: '|| v_order_id );
dbms_output.put_line('Total Amount: RM'|| v_taxed_amount );
END;
/

-- ===============================================================================
-- Function 2: Finding number of orders that a staff has served by staff id.
CREATE OR REPLACE FUNCTION get_order_served_by_staff (p_staff_id IN INT)
RETURN NUMBER
IS
 v_order_count NUMBER;
BEGIN
 DBMS_OUTPUT.PUT_LINE('--- Function: Getting Order Count from Staff ID ' ||
p_staff_id || ' ---');
 SELECT COUNT(*)
 INTO v_order_count
 FROM "Order"
 WHERE STAFFID = p_staff_id;
 RETURN v_order_count; -- Return the calculated count
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('STAFF ID ' || p_staff_id || ' not found in ORDER
assignments.');
 RETURN 0; -- Return 0 if no order found (COUNT(*) already does this)
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('An error occurred in the function: ' || SQLERRM);
 RETURN -1; -- Return a negative value to indicate an error
END;
/

-- Anonymous Block for Function 2:
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT STAFFID PROMPT 'Enter Staff ID: '
DECLARE
v_staff_id staff.staffid%type := &staffid;
v_order_served NUMBER(10,2);
v_staff_name staff.staffname%type;
BEGIN
v_order_served := get_order_served_by_staff(p_staff_id => v_staff_id);
select staffname
into v_staff_name
from staff
where staffid = v_staff_id;
dbms_output.put_line('Staff ID: '|| v_staff_id );
dbms_output.put_line('Staff Name: '|| v_staff_name );
dbms_output.put_line('Total Order Served: '|| v_order_served);
END;
/
