# HR Database Project (MySQL)

This project demonstrates the **HR (Human Resources) database schema** in MySQL along with 20 practical SQL queries.  
It is widely used for learning **SQL, HR Analytics, and employee management use cases**.  

---

## 📌 Database Overview

The HR database models a company's workforce. It contains tables for **employees, departments, jobs, job history, and locations**.  
It is designed to practice joins, filtering, aggregation, and reporting queries.

---

## 🗂️ Schema Details

### 1. employees
Stores employee information.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| employee_id     | INT (PK)    | Unique ID for each employee |
| first_name      | VARCHAR(20) | Employee first name |
| last_name       | VARCHAR(25) | Employee last name |
| email           | VARCHAR(25) | Work email |
| phone_number    | VARCHAR(20) | Contact number |
| hire_date       | DATE        | Date employee was hired |
| job_id          | VARCHAR(10) | Job role (FK → jobs.job_id) |
| salary          | DECIMAL(8,2)| Monthly salary |
| commission_pct  | DECIMAL(2,2)| Commission percentage (if applicable) |
| manager_id      | INT         | Manager’s employee_id (FK → employees.employee_id) |
| department_id   | INT         | Department where employee works (FK → departments.department_id) |

---

### 2. departments
Stores department details.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| department_id   | INT (PK)    | Unique department ID |
| department_name | VARCHAR(30) | Department name |
| manager_id      | INT         | Department manager (FK → employees.employee_id) |
| location_id     | INT         | Location ID (FK → locations.location_id) |

---

### 3. jobs
List of job roles in the company.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| job_id          | VARCHAR(10) (PK) | Unique job code |
| job_title       | VARCHAR(35) | Job title/role |
| min_salary      | INT         | Minimum salary allowed for the role |
| max_salary      | INT         | Maximum salary allowed for the role |

---

### 4. job_history
Tracks previous job assignments of employees.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| employee_id     | INT (FK → employees.employee_id) | Employee ID |
| start_date      | DATE        | Job start date |
| end_date        | DATE        | Job end date |
| job_id          | VARCHAR(10) | Job ID (FK → jobs.job_id) |
| department_id   | INT         | Department ID (FK → departments.department_id) |

---

### 5. locations
Stores office locations.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| location_id     | INT (PK)    | Unique location ID |
| street_address  | VARCHAR(40) | Street address |
| postal_code     | VARCHAR(12) | Postal code |
| city            | VARCHAR(30) | City name |
| state_province  | VARCHAR(25) | State/Province |
| country_id      | CHAR(2)     | Country code (FK → countries.country_id) |

---

### 6. countries
Stores country details.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| country_id      | CHAR(2) (PK)| Country code |
| country_name    | VARCHAR(40) | Country name |
| region_id       | INT         | Region ID (FK → regions.region_id) |

---

### 7. regions
Stores world regions.  
| Column Name     | Data Type    | Description |
|-----------------|-------------|-------------|
| region_id       | INT (PK)    | Region ID |
| region_name     | VARCHAR(25) | Region name |

---

## 🔑 Relationships
- **employees.manager_id → employees.employee_id** (self-relation for managers)  
- **employees.job_id → jobs.job_id**  
- **employees.department_id → departments.department_id**  
- **departments.manager_id → employees.employee_id**  
- **departments.location_id → locations.location_id**  
- **locations.country_id → countries.country_id**  
- **countries.region_id → regions.region_id**  
- **job_history.employee_id → employees.employee_id**  

---
