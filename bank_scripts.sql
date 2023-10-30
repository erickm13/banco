create schema bank_service;

use bank_service;


-- tabla de empresas que utilizan el servicio del banco

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    address VARCHAR(255),
    contact_name VARCHAR(255)
);

CREATE TABLE company_employees (
    employee_id INT PRIMARY KEY,
    company_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE company_employee_role (
    role_id INT PRIMARY KEY,
    company_id INT,
    role_name VARCHAR(100),
    description VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE bank_services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    description VARCHAR(255),
    other_service_details TEXT
);

CREATE TABLE services_company (
    service_company_id INT PRIMARY KEY,
    company_id INT,
    service_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (service_id) REFERENCES bank_services(service_id)
);



-- tablas de las personas que tienen  cuentas en el banco
CREATE TABLE types(
    type INT,
    name varchar(255),
    PRIMARY KEY(type)
);

CREATE TABLE accounts(
    account_id INT,
    type INT,
    balance DECIMAL(12, 2),
    PRIMARY KEY(account_id),
    FOREIGN KEY (type) REFERENCES types(type)
);

CREATE TABLE clients (
	user_id INT NOT NULL,
    dpi INT NOT NULL,
    full_name varchar(255) NOT NULL,
    address varchar(255),
    phone_number varchar(255),
    photo varchar(255),
	username varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	PRIMARY KEY(user_id, dpi)
);

CREATE TABLE client_account (
    user_id INT NOT NULL,
    dpi INT NOT NULL,
    account_id INT,
    PRIMARY KEY(user_id, dpi),
    FOREIGN KEY (user_id, dpi) REFERENCES clients(user_id, dpi),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
CREATE TABLE type_credit_loans (
    type INT,
    name varchar(255),
    interest_rate DECIMAL(5, 2),
    description varchar(255),
    PRIMARY KEY(type)
);
CREATE TABLE user_credit_loans (
    credit_loan_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(12, 2),
    credit_loan_type INT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (credit_loan_type) REFERENCES type_credit_loans(type)
);

CREATE TABLE credit_score (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    dpi INT,
    score DECIMAL(5, 2),
    calculated_date DATE,
    description VARCHAR(255),
    FOREIGN KEY (user_id, dpi) REFERENCES clients(user_id, dpi)
);

CREATE TABLE credit_score_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    score_id INT,
    user_id INT,
    dpi INT,
    current_score DECIMAL(5, 2),
    previous_score DECIMAL(5, 2),
    calculation_date DATE,
    description VARCHAR(255),
    FOREIGN KEY (user_id, dpi) REFERENCES clients(user_id, dpi),
    FOREIGN KEY (score_id) REFERENCES credit_score(score_id)
);

-- Tablas de los empleados del banco
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_date DATE,
    email VARCHAR(255),
    phone_number VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employee_department (
    employee_department_id INT PRIMARY KEY,
    employee_id INT,
    department_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE job_title (
    job_title INT PRIMARY KEY,
    title VARCHAR(100),
    salary DECIMAL
);

CREATE TABLE employee_job_title (
    employee_job_title_id INT PRIMARY KEY,
    employee_id INT,
    job_title_id INT,
    start_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (job_title_id) REFERENCES job_title(job_title)
);
