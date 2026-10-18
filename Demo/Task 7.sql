-- Procedure 1: Adding 10 points to membership points based on the customer id entered by the user.
CREATE OR REPLACE PROCEDURE add_membership_point (
 p_customer_id IN customer.customerid%TYPE
) IS
BEGIN
 UPDATE customer
 SET membershippoint = membershippoint + 10
 WHERE customerid = p_customer_id;
 DBMS_OUTPUT.PUT_LINE('Successfully added 10 loyalty points to Customer ID: ' ||
p_customer_id);
END;
/

-- Anonymous Block to call Procedure 1:
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT customer_id PROMPT 'Enter Customer ID : '
DECLARE
 v_customer_id customer.customerid%TYPE := &customer_id;
BEGIN
 add_membership_point(p_customer_id => v_customer_id);
END;
/
-- =========================================================================================
-- Procedure 2: Deduct the stock quantity for selected product id by asking quantity used.
CREATE OR REPLACE PROCEDURE deduct_stock (
 p_product_id IN product.productid%TYPE,
 p_quantity_used IN NUMBER
) IS
BEGIN
 UPDATE product
 SET stockquantity = stockquantity - p_quantity_used
 WHERE productid = p_product_id;
 DBMS_OUTPUT.PUT_LINE('Successfully deducted Product Stock for Product: ' ||
p_product_id);
END;
/

-- Anonymous Block for Procedure 2:
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT prod_id PROMPT 'Enter Product ID : '
ACCEPT prod_quantity PROMPT 'Enter Quantity Used : '
DECLARE
 v_prod_id product.productid%TYPE := &prod_id;
 v_prod_quantity NUMBER := &prod_quantity;
BEGIN
 deduct_stock(p_product_id => v_prod_id, p_quantity_used => v_prod_quantity);
END;
/

