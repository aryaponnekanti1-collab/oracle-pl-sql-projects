-- Sample Stored Procedure: Get Employee Details

CREATE OR REPLACE PROCEDURE get_employee_details (
    p_emp_id     IN NUMBER,
    p_emp_name   OUT VARCHAR2,
    p_salary     OUT NUMBER
)
IS
BEGIN
    SELECT emp_name, salary
    INTO p_emp_name, p_salary
    FROM employees
    WHERE emp_id = p_emp_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_emp_name := 'Not Found';
        p_salary := 0;
    WHEN OTHERS THEN
        p_emp_name := 'Error';
        p_salary := -1;
END;
/
