CREATE TABLE IF NOT EXISTS customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    telephone VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    name_product VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    sku VARCHAR(30),
    base_price DECIMAL(10,2) NOT NULL

);

CREATE TABLE IF NOT EXISTS order (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT NOT NULL,
    data_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status_order VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS order_item (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  id_order INT NOT NULL,
  id_product INT NOT NULL,
  amount INT NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,

  CONSTRAINT fk_item_order_order
    FOREIGN KEY (id_order) REFERENCES order(id_order)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  CONSTRAINT fk_item_order_product
    FOREIGN KEY (id_product) REFERENCES product(id_product)
    ON UPDATE CASCADE
    ON DELETE RESTRICT

);

INSERT INTO customer (name,lastname,birthday,email,sex,telephone)
VALUES ('Paulo','Cardoso','1954-01-04','paulo@gmail.com','M', '11988770011'),
       ('Juliana','Sousa','1992-06-23','ju@hotmail.com','F', '11988752342'),
       ('Laura','Gold','1990-01-01','eliana@gmail.com','F', '11988661221'),
       ('Carlos','Cardoso','1952-02-13','carlos@hotmail.com','M', '11966451314'),
       ('Roberta','Alves','1995-05-08','ro.alves@outlook.com','F', '11975443140');


INSERT INTO product (name_product, description, sku, base_price)
VALUES ('Galaxy A26 5G (256GB) Verde', 'Smartphone da Samsung Top de linha.', 'DV-010101010', 5000.00),
       ('Vision AI TV 65 polegadas Neo QLED 4K QN1EF 2025', 'TV TOP de Linha', 'DV-060502025', 2500.00),
       ('Console Nintendo Switch 2', 'A próxima evolução do console Nintendo Switch.', 'CS-030303030', 4550.00),
       ('Caixa De Som Go Essential 2', 'Com potência de saída de 3.1 W.', 'GM-040404040', 390.90),
       ('Smartwatch Positivo Watch Essential', 'Tela Ips 1.83 Monitoramento De Exercícios.', 'DV-050505050', 159.90),
       ('Fone de Ouvido Sem Fio HUAWEI FreeBuds SE 2', 'Bluetooth - Preto', 'DV-020202020', 99.90)