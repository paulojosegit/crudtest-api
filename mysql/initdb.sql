CREATE TABLE IF NOT EXISTS customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    telephone VARCHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXIST orders (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT NOT NULL,
    data_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status_order VARCHAR(10) NOT NULL
    FOREIGN KEY (id_customer) REFERENCES (id)
)

INSERT INTO customer (name,lastname,birthday,email,sex,telephone)
VALUES ('Paulo','Campos','1984/12/14','paulo@gmail.com','M', '11988770011'),
       ('Julia','Assis','1992/22/04','ju@hotmail.com','F', '11988752342'),
       ('Laura','Gold','1990/01/01','eliana@gmail.com','F', '11988661221'),
       ('Carlos','Campos','1952/02/13','carlos@hotmail.com','M', '11966451314'),
       ('Roberta','ALves','1995/05/08','ro.alves@outlook.com','F', '11975443140')