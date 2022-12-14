CREATE TABLE medical_histories (
 id INT GENERATED ALWAYS AS IDENTITY,
 admitted_at TIMESTAMP,
 patient_id INT,
 status VARCHAR,
 fk_patientsmedical_histories FOREIGN KEY (patient_id) REFERENCES patients(id),
);

CREATE TABLE patients (
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR,
 date_of_birth DATE,
 PRIMARY KEY(id)
);

ALTER TABLE medical_histories 
  ADD CONSTRAINT fk_patientsmedical_histories
    FOREIGN KEY (patient_id) REFERENCES patients(id);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type  VARCHAR,
  name VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments (
  medical_history_id  INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
)

CREATE TABLE invoices(
 id INT GENERATED ALWAYS AS IDENTITY,
 total_amount DEC,
 generated_at TIMESTAMP,
 payed_at TIMESTAMP,
 medical_history_id INT,
 PRIMARY KEY(id),
 FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
  id  INT GENERATED ALWAYS AS IDENTITY,
  unit_price  DEC,
  quantity INT,
  total_price DEC,
  invoice_id   INT,
  treatment_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);