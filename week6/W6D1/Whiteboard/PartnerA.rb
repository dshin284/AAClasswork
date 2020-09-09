# Partner A: White Boarding

Ask your partner the below questions! **Don't spend longer than 20 minutes per
coding question.** Start a timer once the question has finished being read (or
the relevant information has been presented).

## Question One: Employees Query

You are given a PostgreSQL database with two tables: the first is an `employees`
table and the second is a `departments` table. Employees can belong to a single
department.

1.  Write a SQL query that, given a department name, finds all the employees
    `name`s that are in that department.

2.  Next find the name of the employees that don't belong to any department

#department name
#id, dept_name, employees.id, address, year
#employee name
#id, employee_id, employee_name, age

#Dave: Solution
SELECT
name
FROM
department
JOIN    
employees on employees.id = department.employees_id
WHERE

;

#### Solution

```sql

--  1.
SELECT
  employees.name
FROM
  employees
JOIN
  departments ON employees.department_id = departments.id
WHERE
  departments.name = ?


--  2.
SELECT
  employees.name
FROM
  employees
WHERE
  employees.department_id IS NULL;

```
#Describe the differences between a primary key and a foreign key.
## Question Two:
  # primary key always be id, and the foreign key, is always be the integer typed. We need to using the foreign 
  # to join different tables














###################################################################################
**Answer**: A primary key uniquely identifies a record in the relational
database table, whereas a foreign key refers to the `id` column which is the
primary key of **another** table.

## Question Three:

Given the following table write all the `belongs_to` and `has_many` **and**
`has_many through` associations for models based on the below table
(`Physician`, `Appointment`, and `Patient`)

```ruby
# == Schema Information
#
# Table name: physicians
#
#  id   :integer          not null, primary key
#  name :string           not null


# Table name: appointments
#
#  id   :integer           not null, primary key
#  physician_id :integer   not null
#  patient_id :integer     not null


# Table name: patients
#
#  id   :integer           not null, primary key
#  name :string            not null
#  primary_physician_id :integer

```

# Dave's solution:

#physicians.rb
has_many :appointments, 
    primary_key: :id,
    foreign_key: :physician_id,
    class_name: :Appointments

has_many :patients,
    primary_key: :id,
    foreign_key: :primary_physician_id,
    class_name: :Patients

#appointments.rb
belongs_to :physician,
    primary_key: :id,
    foreign_key: :physician_id,
    class_name: :Physicians

belongs_to :patient,
    primary_key: :id,
    foreign_key: :patient_id,
    class_name: :Patients

#patients.rb
has_many :appointments,
    primary_key: :id,
    foreign_key: :patient_id,
    class_name: :Appointments

belongs_to :primary_physician,
    primary_key: :id,
    foreign_key: :primary_physician_id,
    class_name: :Physicians




#### Solution

```ruby
class Physician < ApplicationRecord
  has_many :appointments,
    class_name: 'Appointment',
    foreign_key: :physician_id,
    primary_key: :id

  has_many :primary_patients,
    class_name: 'Patient',
    foreign_key: :primary_physician_id,
    primary_key: :id

  has_many :general_patients,
    through: :appointments,
    source: :patient

  has_many :primary_patient_appointments,
    through: :primary_patients,
    source: :appointments

end

class Appointment < ApplicationRecord
  belongs_to :physician,
    class_name: 'Physician',
    foreign_key: :physician_id,
    primary_key: :id

  belongs_to :patient,
    class_name: 'Patient',
    foreign_key: :patient_id,
    primary_key: :id
end

class Patient < ApplicationRecord
  has_many :appointments
    class_name: 'Appointment',
    foreign_key: :patient_id,
    primary_key: :id

  belongs_to :primary_care_physician
    class_name: 'Physician',
    foreign_key: :primary_physician_id,
    primary_key: :id
end
```

## Question Four:

Paraphrase the advantages of using an ORM (like ActiveRecord).
 The advantages of using ORM like ActiveRecord is that the user can
 use easier language such as Ruby to create, update, read, delete data from 
 a database, the transactions of moving the data is faster, fewer syntax mistakes
 because it is not SQL, simpler for most users.
 
 ORM ActiveRecord allows user to handle data in an object oriented way.
 ORM ActiveRecord will make the rows into objects during fetech operation.
 Then it will translate your Ruby objects back to rows on save resulting in less
 database access code.  database access code is not good. Cumbersome. 



**Answer**: Using an ORM (Object Relational Model) allows you to interact with
database information in an OOP way. An ORM like ActiveRecord will translate rows
from your SQL tables into Ruby objects on fetch, and translates your Ruby
objects back to rows on save resulting in less overall database access code.

## Question Five:

When are model validations run?


#zhang's answer: 


Model validations are code that makes sure that only correct or valid data
is saved into the database.









**Answer**: Whenever a model instance is _updated_ or _saved_ to the database.

## Question Six:

Given the following Schema:

```ruby

# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer
```

Write two SQL Queries:

1.  List the films where 'Harrison Ford' has appeared - but not in the star
    role.
    - **Note:** the `ord` field of casting gives the position of the actor. If
      `ord=1` then this actor is in the starring role
2.  Obtain a list in alphabetical order of actors who've had at least 15
    starring roles.


#Zhang's answer

SELECT  
  movies.title
FROM
  movies
JOIN  
  castings on movie.id = castings.movie_id
JOIN
  actors on castings.actor_id = actors.id
WHERE 
  (actors.name = 'Harrison Ford' AND castings.ord != 1);


######################################################################################
### Solution

```sql
-- 1. List the films where 'Harrison Ford' has appeared - but not in the star role.
SELECT
    movies.title
FROM
    movies
JOIN
    castings ON castings.movie_id = movies.id
JOIN
    actors ON actors.id = castings.actor_id
WHERE
    (actors.name = 'Harrison Ford' AND castings.ord != 1);

-- 2 -   Obtain a list in alphabetical order of actors who've had at least 15 starring roles.
SELECT
    actors.name
FROM
    actors
JOIN
    castings ON castings.actor_id = actors.id
WHERE
    castings.ord = 1
GROUP BY
    actors.name
HAVING
    COUNT(*) >= 15
ORDER BY
    actors.name;
```

## Question Seven:

Identify the difference between a `has_many through` and a `has_one`
association?
"Has_many through" is an association where the specified class has multiple
relationships to the connected class. So if class A is connected to class B,
class A has many class B objects tied to it. 
    "has_one" means that there is only a one to one relationship. 


'has_many' makes sure a record (row) holds a column (primary key) that is 
referred to  by a foreign_key by matching or connected records. 
"has_one" is a "has_many" association whre at most one associated record(row)
will exist. 


**Answer**: We use `has_many` when a record holds a column (the primary key)
that is referred to by a foreign key in the associated records. `has_one` is a
`has_many` association where at most one associated record will exist so we will
only return a single instance of the model.
