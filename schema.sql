
CREATE DATABASE ecommerce_project;
USE ecommerce_project;

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    cost DECIMAL(10,2),
    stock_quantity INT,
    details JSON,
    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATE,
    order_status VARCHAR(30),
    shipping_city VARCHAR(50),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_item_id INT,
    return_date DATE,
    return_quantity INT,
    return_reason VARCHAR(100),
    refund_amount DECIMAL(10,2),
    FOREIGN KEY (order_item_id)
        REFERENCES order_items(order_item_id)
);
INSERT INTO customers VALUES
('C01','Anu','anu@gmail.com','Chennai','Tamil Nadu','2025-01-10'),
('C02','Rahul','rahul@gmail.com','Salem','Tamil Nadu','2025-02-15'),
('C03','Aisha','aisha@gmail.com','Bangalore','Karnataka','2025-03-05'),
('C04','Arjun','arjun@gmail.com','Coimbatore','Tamil Nadu','2025-03-20'),
('C05','Meera','meera@gmail.com','Hyderabad','Telangana','2025-04-12'),
('C06','Vikram','vikram@gmail.com','Chennai','Tamil Nadu','2025-05-01'),
('C07','Sara','sara@gmail.com','Mumbai','Maharashtra','2025-06-18'),
('C08','Neha','neha@gmail.com','Salem','Tamil Nadu','2025-07-22'),
('C09','Kiran','kiran@gmail.com','Pune','Maharashtra','2025-08-10'),
('C10','Priya','priya@gmail.com','Bangalore','Karnataka','2025-09-01');


INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Furniture'),
(3,'Clothing'),
(4,'Home Appliances'),
(5,'Accessories');


INSERT INTO products VALUES
(101,'Laptop',1,55000,42000,20,
 '{"brand":"Dell","ram":"16GB","color":"Silver"}'),
(102,'Smartphone',1,25000,18000,35,
 '{"brand":"Samsung","ram":"8GB","color":"Black"}'),
(103,'Headphones',5,3000,1500,50,
 '{"brand":"Sony","type":"Wireless","color":"Black"}'),
(104,'Office Chair',2,8000,5000,15,
 '{"material":"Leather","color":"Brown"}'),
(105,'Study Table',2,12000,8000,12,
 '{"material":"Wood","color":"Oak"}'),
(106,'T-Shirt',3,800,350,100,
 '{"size":"M","color":"Blue"}'),
(107,'Jeans',3,1800,900,70,
 '{"size":"32","color":"Black"}'),
(108,'Mixer Grinder',4,4500,2800,25,
 '{"brand":"Preethi","capacity":"750W"}'),
(109,'Smart Watch',5,6000,3500,30,
 '{"brand":"Noise","color":"Black"}'),
(110,'Refrigerator',4,28000,22000,10,
 '{"brand":"LG","capacity":"260L"}');


INSERT INTO orders VALUES
(1001,'C01','2025-01-15','Delivered','Chennai'),
(1002,'C02','2025-01-20','Delivered','Salem'),
(1003,'C03','2025-02-05','Delivered','Bangalore'),
(1004,'C01','2025-02-18','Delivered','Chennai'),
(1005,'C04','2025-03-10','Delivered','Coimbatore'),
(1006,'C05','2025-03-22','Cancelled','Hyderabad'),
(1007,'C06','2025-04-02','Delivered','Chennai'),
(1008,'C02','2025-04-15','Delivered','Salem'),
(1009,'C07','2025-05-08','Delivered','Mumbai'),
(1010,'C08','2025-05-19','Delivered','Salem'),
(1011,'C03','2025-06-03','Delivered','Bangalore'),
(1012,'C09','2025-06-20','Pending','Pune'),
(1013,'C10','2025-07-11','Delivered','Bangalore'),
(1014,'C01','2025-08-05','Delivered','Chennai'),
(1015,'C04','2025-09-12','Delivered','Coimbatore'),
(1016,'C06','2025-10-01','Delivered','Chennai'),
(1017,'C08','2025-10-15','Cancelled','Salem'),
(1018,'C09','2025-11-02','Delivered','Pune'),
(1019,'C02','2025-11-20','Delivered','Salem'),
(1020,'C10','2025-12-05','Delivered','Bangalore');


INSERT INTO order_items VALUES
(1,1001,101,1,55000,5),
(2,1001,103,2,3000,0),
(3,1002,104,1,8000,0),
(4,1002,106,3,800,0),
(5,1003,102,1,25000,10),
(6,1003,109,1,6000,0),
(7,1004,105,1,12000,5),
(8,1004,106,2,800,0),
(9,1005,110,1,28000,0),
(10,1005,103,1,3000,0),
(11,1006,101,1,55000,0),
(12,1007,102,2,25000,5),
(13,1007,109,1,6000,0),
(14,1008,107,2,1800,0),
(15,1008,104,1,8000,10),
(16,1009,108,1,4500,0),
(17,1009,106,4,800,0),
(18,1010,101,1,55000,5),
(19,1011,103,2,3000,0),
(20,1011,107,1,1800,0),
(21,1012,105,1,12000,0),
(22,1013,110,1,28000,5),
(23,1013,108,1,4500,0),
(24,1014,102,1,25000,0),
(25,1014,103,1,3000,0),
(26,1015,104,2,8000,5),
(27,1016,109,2,6000,0),
(28,1018,101,1,55000,10),
(29,1019,106,5,800,0),
(30,1020,105,1,12000,0),
(31,1020,103,2,3000,0);


INSERT INTO payments VALUES
(1,1001,'2025-01-15','UPI',60850,'Paid'),
(2,1002,'2025-01-20','Card',10400,'Paid'),
(3,1003,'2025-02-05','UPI',28500,'Paid'),
(4,1004,'2025-02-18','Card',13000,'Paid'),
(5,1005,'2025-03-10','Net Banking',31000,'Paid'),
(6,1006,'2025-03-22','UPI',0,'Failed'),
(7,1007,'2025-04-02','Card',53500,'Paid'),
(8,1008,'2025-04-15','UPI',9880,'Paid'),
(9,1009,'2025-05-08','UPI',7700,'Paid'),
(10,1010,'2025-05-19','Card',52250,'Paid'),
(11,1011,'2025-06-03','UPI',7800,'Paid'),
(12,1012,'2025-06-20','Card',0,'Pending'),
(13,1013,'2025-07-11','Net Banking',30900,'Paid'),
(14,1014,'2025-08-05','UPI',28000,'Paid'),
(15,1015,'2025-09-12','Card',15200,'Paid'),
(16,1016,'2025-10-01','UPI',12000,'Paid'),
(17,1017,'2025-10-15','UPI',0,'Failed'),
(18,1018,'2025-11-02','Card',49500,'Paid'),
(19,1019,'2025-11-20','UPI',4000,'Paid'),
(20,1020,'2025-12-05','Card',18000,'Paid');


INSERT INTO returns VALUES
(1,2,'2025-01-25',1,'Damaged product',3000),
(2,5,'2025-02-12',1,'Wrong product',25000),
(3,14,'2025-04-25',1,'Size issue',1800),
(4,17,'2025-05-25',2,'Defective product',1600),
(5,19,'2025-06-15',1,'Damaged product',3000);

