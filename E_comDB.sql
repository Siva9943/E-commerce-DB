-- 1. users table
create table users (
    id VARCHAR(6) primary key,
    name varchar(255) not null,
    e_mail varchar(255) not null unique,
    password varchar(255) not null,  
    address varchar(255) not null
);
-- 2. product_details table
create table product_details (
    id int primary key,
    name varchar(255) not null unique,
    description varchar(255) not null,
    price float not null
);


-- 3. stock_details table
create table stock_details (
    id int primary key,
    product_id int not null,
    stock_quantity int not null default 0,  
    constraint fk_stock_product foreign key (product_id) references product_details(id) 
);

-- 4. categories table
create table categories (
    id int primary key,
    category_name varchar(255) not null unique
);


-- 5. product_categories table
create table product_categories (
    product_id int not null,
    category_id int not null,
    primary key (product_id, category_id),
    constraint fk_product foreign key (product_id) references product_details(id) ,
    constraint fk_category foreign key (category_id) references categories(id) 
);

-- 6. order_details table
create table order_details (
    id int primary key,
    user_id VARCHAR(6) not null,
    total_amount float not null,
    status varchar(255) not null default 'pending',  
    order_date timestamp default current_timestamp,
    constraint fk_order_user foreign key (user_id) references users(id)
);


-- 7. order_items table
create table order_items (
    id int primary key,
    order_id INT not null,
    product_id int not null,
    quantity int not null,
    price float not null,  
    constraint fk_order foreign key (order_id) references order_details(id),
    constraint fk_order_product foreign key (product_id) references product_details(id) 
);



-- 8. payment_details table
create table payment_details (
    id int primary key,
    order_id INT not null,
    payment_method varchar(255) not null,
    transaction_id varchar(255) unique,
    status varchar(255) not null default 'pending',  
    constraint fk_payment_order foreign key (order_id) references order_details(id) 
);


-- 9. cart_details table
create table cart_details (
    id int primary key,
    user_id VARCHAR(6) not null,
    product_id int not null,
    quantity int not null default 1,
    constraint fk_cart_user foreign key (user_id) references users(id),
    constraint fk_cart_product foreign key (product_id) references product_details(id) 
);

-- 10. delivery_info table
create table delivery_info (
    id int primary key,
    name varchar(255) not null,
    mobile_no bigint not null unique
);

-- 11. shipping table
create table shipping (
    id int primary key,
    order_id int not null,
    status varchar(255) not null default 'processing',  
    delivery_person_id int not null,
    constraint fk_shipping_order foreign key (order_id) references order_details(id),
    constraint fk_shipping_delivery foreign key (delivery_person_id) references delivery_info(id) 
);

INSERT INTO users (id, name, e_mail, password, address) VALUES
('C99001', 'Arun Kumar', 'arun.kumar@example.com', 'pass123', '123, Gandhi St, Chennai'),
('C99002', 'Sneha Reddy', 'sneha.reddy@example.com', 'pass456', '456, MG Road, Bangalore'),
('C99003', 'Rahul Sharma', 'rahul.sharma@example.com', 'pass789', '789, Park Ave, Delhi'),
('C99004', 'Priya Das', 'priya.das@example.com', 'pass101', '101, Lake View, Kolkata'),
('C99005', 'Vikram Singh', 'vikram.singh@example.com', 'pass202', '202, Sector 5, Noida'),
('C99006', 'Divya Iyer', 'divya.iyer@example.com', 'pass303', '303, IT Hub, Pune'),
('C99007', 'Amit Tiwari', 'amit.tiwari@example.com', 'pass404', '404, Main St, Mumbai'),
('C99008', 'Neha Kapoor', 'neha.kapoor@example.com', 'pass505', '505, Residency Rd, Hyderabad'),
('C99009', 'Karthik Raja', 'karthik.raja@example.com', 'pass606', '606, Beach Rd, Chennai'),
('C99010', 'Meera Nair', 'meera.nair@example.com', 'pass707', '707, Green Valley, Kochi'),
('C99011', 'Rajesh Verma', 'rajesh.verma@example.com', 'pass808', '808, Civil Lines, Jaipur'),
('C99012', 'Pooja Bhatia', 'pooja.bhatia@example.com', 'pass909', '909, Hilltop Rd, Shimla'),
('C99013', 'Anil Yadav', 'anil.yadav@example.com', 'pass111', '111, Station Rd, Bhopal'),
('C99014', 'Swati Joshi', 'swati.joshi@example.com', 'pass222', '222, Market St, Lucknow'),
('C99015', 'Manoj Pillai', 'manoj.pillai@example.com', 'pass333', '333, Sunrise Ave, Thiruvananthapuram'),
('C99016', 'Nikita Shah', 'nikita.shah@example.com', 'pass444', '444, Central Plaza, Ahmedabad'),
('C99017', 'Santosh Reddy', 'santosh.reddy@example.com', 'pass555', '555, Jubilee Hills, Hyderabad'),
('C99018', 'Deepak Malhotra', 'deepak.malhotra@example.com', 'pass666', '666, Carter Rd, Mumbai'),
('C99019', 'Anita Choudhary', 'anita.choudhary@example.com', 'pass777', '777, South Ex, Delhi'),
('C99020', 'Suresh Nair', 'suresh.nair@example.com', 'pass888', '888, Tech Park, Bangalore'),
('C99021', 'Kavita Mehta', 'kavita.mehta@example.com', 'pass999', '999, VIP Road, Chandigarh'),
('C99022', 'Ravi Shankar', 'ravi.shankar@example.com', 'pass000', '1000, Golf Course Rd, Gurgaon'),
('C99023', 'Sonia Gupta', 'sonia.gupta@example.com', 'pass112', '112, Mall Rd, Pune'),
('C99024', 'Ajay Desai', 'ajay.desai@example.com', 'pass223', '223, Business Hub, Surat'),
('C99025', 'Bhavna Patel', 'bhavna.patel@example.com', 'pass334', '334, Garden Lane, Rajkot'),
('C99026', 'Vivek Saxena', 'vivek.saxena@example.com', 'pass445', '445, IT Park, Indore'),
('C99027', 'Meghna Rao', 'meghna.rao@example.com', 'pass556', '556, Lakeside Drive, Mysore'),
('C99028', 'Alok Mishra', 'alok.mishra@example.com', 'pass667', '667, Heritage Walk, Varanasi'),
('C99029', 'Sunita Sen', 'sunita.sen@example.com', 'pass778', '778, Temple Street, Bhubaneswar'),
('C99030', 'Rohit Agarwal', 'rohit.agarwal@example.com', 'pass889', '889, Food Plaza, Patna'),
('C99031', 'Preeti Menon', 'preeti.menon@example.com', 'pass990', '990, East End, Guwahati'),
('C99032', 'Harsh Vardhan', 'harsh.vardhan@example.com', 'pass1011', '1011, Sunset Blvd, Jodhpur'),
('C99033', 'Neeraj Kapoor', 'neeraj.kapoor@example.com', 'pass1022', '1022, Diamond Market, Ludhiana'),
('C99034', 'Ritika Sharma', 'ritika.sharma@example.com', 'pass1033', '1033, Main Bazaar, Amritsar'),
('C99035', 'Prakash Rao', 'prakash.rao@example.com', 'pass1044', '1044, IT Corridor, Chennai'),
('C99036', 'Lata Singh', 'lata.singh@example.com', 'pass1055', '1055, Royal Enclave, Bhopal'),
('C99037', 'Gautam Narang', 'gautam.narang@example.com', 'pass1066', '1066, Cine City, Mumbai'),
('C99038', 'Shilpa Das', 'shilpa.das@example.com', 'pass1077', '1077, Hill View, Shillong'),
('C99039', 'Omkar Joshi', 'omkar.joshi@example.com', 'pass1088', '1088, Metro Walk, Nashik'),
('C99040', 'Jaya Iyer', 'jaya.iyer@example.com', 'pass1099', '1099, Silver Street, Coimbatore'),
('C99041', 'Nilesh Yadav', 'nilesh.yadav@example.com', 'pass1110', '1110, Industrial Area, Kanpur'),
('C99042', 'Sakshi Bhandari', 'sakshi.bhandari@example.com', 'pass1121', '1121, City Mall, Raipur'),
('C99043', 'Raman Kumar', 'raman.kumar@example.com', 'pass1132', '1132, Riverside, Goa'),
('C99044', 'Kiran Reddy', 'kiran.reddy@example.com', 'pass1143', '1143, Tech Valley, Visakhapatnam'),
('C99045', 'Shruti Jain', 'shruti.jain@example.com', 'pass1154', '1154, Airport Road, Madurai'),
('C99046', 'Tarun Verma', 'tarun.verma@example.com', 'pass1165', '1165, Grand Market, Udaipur'),
('C99047', 'Monica Das', 'monica.das@example.com', 'pass1176', '1176, North Colony, Siliguri'),
('C99048', 'Deepika Pillai', 'deepika.pillai@example.com', 'pass1187', '1187, Harbor Road, Mangalore'),
('C99049', 'Vishal Chopra', 'vishal.chopra@example.com', 'pass1198', '1198, City Center, Nagpur'),
('C99050', 'Kanchan Malik', 'kanchan.malik@example.com', 'pass1209', '1209, South Avenue, Ranchi');



INSERT INTO product_details (id, name, description, price) VALUES
(1, 'iPhone 15', 'Apple smartphone with A16 chip', 79999.99),
(2, 'Samsung Galaxy S23', 'Flagship Android phone with 120Hz display', 74999.99),
(3, 'Dell XPS 13', 'Ultra-thin laptop with Intel i7', 99999.99),
(4, 'MacBook Air M2', 'Lightweight Apple laptop with M2 chip', 114999.99),
(5, 'Sony WH-1000XM5', 'Wireless noise-canceling headphones', 29999.99),
(6, 'JBL Flip 6', 'Portable Bluetooth speaker with deep bass', 10999.99),
(7, 'Canon EOS R6', 'Mirrorless camera with 4K recording', 159999.99),
(8, 'GoPro Hero 12', 'Action camera with waterproof design', 48999.99),
(9, 'Logitech MX Master 3', 'Wireless ergonomic mouse', 8999.99),
(10, 'HP LaserJet Pro', 'High-speed laser printer', 34999.99),
(11, 'Samsung 55" Smart TV', '4K Ultra HD Smart TV with HDR', 69999.99),
(12, 'LG Refrigerator', 'Double-door fridge with inverter technology', 48999.99),
(13, 'Bosch Washing Machine', 'Fully automatic front-load washer', 39999.99),
(14, 'Dyson V11 Vacuum Cleaner', 'Cordless vacuum with powerful suction', 52999.99),
(15, 'Philips Air Fryer', 'Oil-free healthy cooking appliance', 12999.99),
(16, 'Nike Air Max 270', 'Stylish and comfortable sneakers', 12999.99),
(17, 'Adidas Ultraboost', 'Running shoes with responsive cushioning', 13999.99),
(18, 'Puma Sports T-Shirt', 'Moisture-wicking athletic wear', 2499.99),
(19, 'Levi’s 501 Jeans', 'Classic fit denim jeans', 4999.99),
(20, 'Ray-Ban Aviator Sunglasses', 'Iconic polarized sunglasses', 8999.99),
(21, 'Fossil Gen 6 Smartwatch', 'Wear OS smartwatch with heart rate monitor', 18999.99),
(22, 'Apple Watch Series 9', 'Fitness tracker with ECG and GPS', 44999.99),
(23, 'Fitbit Charge 5', 'Health tracker with SpO2 monitoring', 15999.99),
(24, 'Nivea Men Face Wash', 'Deep clean and oil control face wash', 399.99),
(25, 'Maybelline Lipstick', 'Long-lasting matte lipstick', 699.99),
(26, 'Lakme Sunscreen', 'SPF 50 sun protection cream', 499.99),
(27, 'Himalaya Neem Face Wash', 'Herbal skin cleanser', 199.99),
(28, 'Nestlé KitKat', 'Crispy chocolate wafer', 49.99),
(29, 'Amul Butter', 'Fresh dairy butter', 55.99),
(30, 'Cadbury Dairy Milk', 'Smooth and creamy milk chocolate', 99.99),
(31, 'Taj Mahal Tea', 'Premium tea leaves', 299.99),
(32, 'Nescafe Gold Coffee', 'Instant coffee blend', 449.99),
(33, 'Pepsi 2L Bottle', 'Refreshing carbonated drink', 99.99),
(34, 'Domino’s Frozen Pizza', 'Ready-to-eat pepperoni pizza', 499.99),
(35, 'Wooden Study Table', 'Compact and stylish work desk', 8999.99),
(36, 'Recliner Sofa', 'Comfortable and adjustable seating', 34999.99),
(37, 'Godrej Wardrobe', 'Spacious steel almirah', 25999.99),
(38, 'Wakefit Mattress', 'Memory foam mattress for back support', 19999.99),
(39, 'IKEA Bookshelf', 'Modern bookshelf with adjustable shelves', 6999.99),
(40, 'LEGO Star Wars Set', 'Collectible toy for kids and adults', 7999.99),
(41, 'Barbie Dollhouse', 'Miniature home for Barbie dolls', 14999.99),
(42, 'Hot Wheels Car Set', 'Die-cast racing cars collection', 2999.99),
(43, 'UNO Card Game', 'Classic family card game', 499.99),
(44, 'Monopoly Board Game', 'Real estate trading game', 1599.99),
(45, 'Marlboro Gold Pack', 'Premium tobacco cigarettes', 399.99),
(46, 'Classic Milds Cigars', 'Hand-rolled cigars from Cuba', 1999.99),
(47, 'Nicotex Chewing Gum', 'Nicotine gum for smoking cessation', 299.99),
(48, 'Clove Cigarettes', 'Flavored tobacco product', 599.99),
(49, 'Davidoff Cigar', 'Luxury hand-crafted cigar', 4999.99),
(50, 'Mild Seven Blue', 'Japanese tobacco blend', 499.99);



INSERT INTO stock_details (id, product_id, stock_quantity) VALUES
(1, 1, 50),
(2, 2, 40),
(3, 3, 30),
(4, 4, 25),
(5, 5, 60),
(6, 6, 35),
(7, 7, 20),
(8, 8, 15),
(9, 9, 45),
(10, 10, 55),
(11, 11, 25),
(12, 12, 30),
(13, 13, 50),
(14, 14, 10),
(15, 15, 40),
(16, 16, 70),
(17, 17, 35),
(18, 18, 80),
(19, 19, 45),
(20, 20, 55),
(21, 21, 20),
(22, 22, 30),
(23, 23, 50),
(24, 24, 40),
(25, 25, 60),
(26, 26, 90),
(27, 27, 75),
(28, 28, 100),
(29, 29, 120),
(30, 30, 110),
(31, 31, 85),
(32, 32, 95),
(33, 33, 150),
(34, 34, 60),
(35, 35, 25),
(36, 36, 30),
(37, 37, 15),
(38, 38, 40),
(39, 39, 50),
(40, 40, 80),
(41, 41, 90),
(42, 42, 75),
(43, 43, 65),
(44, 44, 55),
(45, 45, 200),
(46, 46, 150),
(47, 47, 140),
(48, 48, 120),
(49, 49, 110),
(50, 50, 130);


INSERT INTO categories (id, category_name) VALUES
(1, 'Electronics'),
(2, 'Fashion & Apparel'),
(3, 'Food & Beverages'),
(4, 'Furniture'),
(5, 'Beauty & Personal Care'),
(6, 'Toys & Hobbies'),
(7, 'Sports & Fitness'),
(8, 'Home Appliances'),
(9, 'Automobiles & Accessories'),
(10, 'Books & Stationery');


INSERT INTO product_categories (product_id, category_id) VALUES
-- Electronics
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1),
-- Home Appliances
(11, 8), (12, 8), (13, 8), (14, 8), (15, 8),
-- Fashion & Apparel
(16, 2), (17, 2), (18, 2), (19, 2), (20, 2),
-- Sports & Fitness
(21, 7), (22, 7), (23, 7),
-- Beauty & Personal Care
(24, 5), (25, 5), (26, 5), (27, 5),
-- Food & Beverages
(28, 3), (29, 3), (30, 3), (31, 3), (32, 3), (33, 3), (34, 3),
-- Furniture
(35, 4), (36, 4), (37, 4), (38, 4), (39, 4),
-- Toys & Hobbies
(40, 6), (41, 6), (42, 6), (43, 6), (44, 6),
-- Tobacco Products
(45, 3), (46, 3), (47, 3), (48, 3), (49, 3), (50, 3);


INSERT INTO order_details (id, user_id, total_amount, status) VALUES
(1, 'C99001', 500.50, 'pending'),
(2, 'C99002', 1200.75, 'shipped'),
(3, 'C99003', 650.00, 'delivered'),
(4, 'C99004', 899.99, 'cancelled'),
(5, 'C99005', 220.00, 'pending'),
(6, 'C99006', 310.20, 'delivered'),
(7, 'C99007', 499.49, 'shipped'),
(8, 'C99008', 1500.00, 'delivered'),
(9, 'C99009', 725.89, 'pending'),
(10, 'C99010', 330.30, 'shipped'),
(11, 'C99001', 1299.00, 'delivered'),
(12, 'C99002', 499.99, 'pending'),
(13, 'C99003', 899.50, 'cancelled'),
(14, 'C99004', 599.75, 'shipped'),
(15, 'C99005', 1199.99, 'delivered'),
(16, 'C99006', 250.50, 'pending'),
(17, 'C99007', 499.90, 'shipped'),
(18, 'C99008', 849.00, 'pending'),
(19, 'C99009', 199.99, 'delivered'),
(20, 'C99010', 699.50, 'shipped'),
(21, 'C99001', 299.25, 'pending'),
(22, 'C99002', 799.99, 'shipped'),
(23, 'C99003', 350.75, 'delivered'),
(24, 'C99004', 499.99, 'cancelled'),
(25, 'C99005', 999.00, 'pending'),
(26, 'C99006', 200.75, 'shipped'),
(27, 'C99007', 149.99, 'delivered'),
(28, 'C99008', 650.50, 'pending'),
(29, 'C99009', 1299.99, 'shipped'),
(30, 'C99010', 850.00, 'delivered'),
(31, 'C99001', 450.00, 'pending'),
(32, 'C99002', 750.50, 'shipped'),
(33, 'C99003', 999.99, 'delivered'),
(34, 'C99004', 599.49, 'cancelled'),
(35, 'C99005', 1200.00, 'shipped'),
(36, 'C99006', 345.75, 'pending'),
(37, 'C99007', 899.25, 'shipped'),
(38, 'C99008', 799.50, 'delivered'),
(39, 'C99009', 599.99, 'pending'),
(40, 'C99010', 249.75, 'shipped'),
(41, 'C99001', 1100.99, 'delivered'),
(42, 'C99002', 450.00, 'pending'),
(43, 'C99003', 299.49, 'shipped'),
(44, 'C99004', 650.00, 'pending'),
(45, 'C99005', 850.99, 'delivered'),
(46, 'C99006', 599.99, 'shipped'),
(47, 'C99007', 250.00, 'pending'),
(48, 'C99008', 449.75, 'shipped'),
(49, 'C99009', 1299.00, 'delivered'),
(50, 'C99010', 999.49, 'pending');


INSERT INTO order_items (id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 2, 999.99),
(2, 1, 3, 1, 499.50),
(3, 2, 5, 1, 299.99),
(4, 2, 7, 3, 899.75),
(5, 3, 9, 2, 1200.00),
(6, 3, 2, 1, 750.50),
(7, 4, 4, 1, 450.00),
(8, 4, 8, 2, 999.99),
(9, 5, 6, 4, 250.75),
(10, 5, 10, 1, 199.99),
(11, 6, 12, 3, 650.50),
(12, 6, 14, 2, 1299.99),
(13, 7, 16, 1, 450.00),
(14, 7, 18, 2, 799.50),
(15, 8, 20, 3, 599.99),
(16, 8, 1, 2, 249.75),
(17, 9, 3, 1, 1100.99),
(18, 9, 5, 2, 450.00),
(19, 10, 7, 3, 299.49),
(20, 10, 9, 2, 650.00),
(21, 1, 11, 1, 850.99),
(22, 1, 13, 2, 599.99),
(23, 2, 15, 3, 250.00),
(24, 2, 17, 1, 449.75),
(25, 3, 19, 2, 1299.00),
(26, 3, 1, 3, 999.49),
(27, 4, 2, 1, 899.99),
(28, 4, 3, 2, 199.50),
(29, 5, 4, 3, 399.99),
(30, 5, 5, 1, 599.75),
(31, 6, 6, 2, 1200.00),
(32, 6, 7, 1, 799.50),
(33, 7, 8, 3, 250.75),
(34, 7, 9, 2, 450.00),
(35, 8, 10, 1, 999.99),
(36, 8, 12, 2, 1299.99),
(37, 9, 14, 3, 850.00),
(38, 9, 16, 1, 450.00),
(39, 10, 18, 2, 199.99),
(40, 10, 20, 3, 650.50),
(41, 1, 5, 1, 1299.00),
(42, 2, 7, 2, 750.50),
(43, 3, 9, 3, 299.99),
(44, 4, 11, 1, 850.00),
(45, 5, 13, 2, 450.00),
(46, 6, 15, 3, 249.75),
(47, 7, 17, 1, 599.99),
(48, 8, 19, 2, 450.00),
(49, 9, 1, 3, 1299.99),
(50, 10, 3, 1, 799.50);



INSERT INTO payment_details (id, order_id, payment_method, transaction_id, status) VALUES
(1, 1, 'Credit Card', 'TXN10001', 'completed'),
(2, 2, 'UPI', 'TXN10002', 'pending'),
(3, 3, 'Debit Card', 'TXN10003', 'completed'),
(4, 4, 'Net Banking', 'TXN10004', 'failed'),
(5, 5, 'PayPal', 'TXN10005', 'completed'),
(6, 6, 'UPI', 'TXN10006', 'pending'),
(7, 7, 'Credit Card', 'TXN10007', 'completed'),
(8, 8, 'Debit Card', 'TXN10008', 'completed'),
(9, 9, 'Net Banking', 'TXN10009', 'pending'),
(10, 10, 'Credit Card', 'TXN10010', 'failed'),
(11, 11, 'PayPal', 'TXN10011', 'completed'),
(12, 12, 'UPI', 'TXN10012', 'pending'),
(13, 13, 'Debit Card', 'TXN10013', 'completed'),
(14, 14, 'Net Banking', 'TXN10014', 'failed'),
(15, 15, 'Credit Card', 'TXN10015', 'completed'),
(16, 16, 'PayPal', 'TXN10016', 'pending'),
(17, 17, 'UPI', 'TXN10017', 'completed'),
(18, 18, 'Debit Card', 'TXN10018', 'completed'),
(19, 19, 'Net Banking', 'TXN10019', 'failed'),
(20, 20, 'Credit Card', 'TXN10020', 'pending'),
(21, 21, 'PayPal', 'TXN10021', 'completed'),
(22, 22, 'UPI', 'TXN10022', 'pending'),
(23, 23, 'Debit Card', 'TXN10023', 'completed'),
(24, 24, 'Net Banking', 'TXN10024', 'failed'),
(25, 25, 'Credit Card', 'TXN10025', 'completed'),
(26, 26, 'PayPal', 'TXN10026', 'pending'),
(27, 27, 'UPI', 'TXN10027', 'completed'),
(28, 28, 'Debit Card', 'TXN10028', 'completed'),
(29, 29, 'Net Banking', 'TXN10029', 'failed'),
(30, 30, 'Credit Card', 'TXN10030', 'pending'),
(31, 31, 'PayPal', 'TXN10031', 'completed'),
(32, 32, 'UPI', 'TXN10032', 'pending'),
(33, 33, 'Debit Card', 'TXN10033', 'completed'),
(34, 34, 'Net Banking', 'TXN10034', 'failed'),
(35, 35, 'Credit Card', 'TXN10035', 'completed'),
(36, 36, 'PayPal', 'TXN10036', 'pending'),
(37, 37, 'UPI', 'TXN10037', 'completed'),
(38, 38, 'Debit Card', 'TXN10038', 'completed'),
(39, 39, 'Net Banking', 'TXN10039', 'failed'),
(40, 40, 'Credit Card', 'TXN10040', 'pending'),
(41, 41, 'PayPal', 'TXN10041', 'completed'),
(42, 42, 'UPI', 'TXN10042', 'pending'),
(43, 43, 'Debit Card', 'TXN10043', 'completed'),
(44, 44, 'Net Banking', 'TXN10044', 'failed'),
(45, 45, 'Credit Card', 'TXN10045', 'completed'),
(46, 46, 'PayPal', 'TXN10046', 'pending'),
(47, 47, 'UPI', 'TXN10047', 'completed'),
(48, 48, 'Debit Card', 'TXN10048', 'completed'),
(49, 49, 'Net Banking', 'TXN10049', 'failed'),
(50, 50, 'Credit Card', 'TXN10050', 'pending');

INSERT INTO cart_details (id, user_id, product_id, quantity) VALUES
-- User C99001 (2 products)
(1, 'C99001', 5, 2), (2, 'C99001', 8, 1),

-- User C99002 (7 products)
(3, 'C99002', 12, 3), (4, 'C99002', 15, 1), (5, 'C99002', 19, 2), (6, 'C99002', 22, 1), (7, 'C99002', 27, 4), (8, 'C99002', 30, 2), (9, 'C99002', 33, 1),

-- User C99003 (3 products)
(10, 'C99003', 36, 3), (11, 'C99003', 40, 1), (12, 'C99003', 44, 2),

-- User C99004 (1 product)
(13, 'C99004', 48, 3),

-- User C99005 (5 products)
(14, 'C99005', 2, 1), (15, 'C99005', 6, 2), (16, 'C99005', 10, 1), (17, 'C99005', 14, 4), (18, 'C99005', 18, 1),

-- User C99006 (3 products)
(19, 'C99006', 23, 3), (20, 'C99006', 28, 2), (21, 'C99006', 32, 1),

-- User C99007 (2 products)
(22, 'C99007', 37, 3), (23, 'C99007', 41, 2),

-- User C99008 (7 products)
(24, 'C99008', 45, 1), (25, 'C99008', 49, 4), (26, 'C99008', 3, 2), (27, 'C99008', 7, 1), (28, 'C99008', 11, 3), (29, 'C99008', 16, 2), (30, 'C99008', 20, 1),

-- User C99009 (1 product)
(31, 'C99009', 25, 3),

-- User C99010 (5 products)
(32, 'C99010', 29, 1), (33, 'C99010', 34, 2), (34, 'C99010', 38, 3), (35, 'C99010', 42, 1), (36, 'C99010', 46, 2),

-- User C99011 (3 products)
(37, 'C99011', 50, 4), (38, 'C99011', 4, 1), (39, 'C99011', 9, 2),

-- User C99012 (2 products)
(40, 'C99012', 13, 3), (41, 'C99012', 17, 1),

-- User C99013 (1 product)
(42, 'C99013', 21, 2),

-- User C99014 (7 products)
(43, 'C99014', 26, 3), (44, 'C99014', 31, 1), (45, 'C99014', 35, 2), (46, 'C99014', 39, 3), (47, 'C99014', 43, 1), (48, 'C99014', 47, 4), (49, 'C99014', 1, 2),

-- User C99015 (5 products)
(50, 'C99015', 5, 3), (51, 'C99015', 8, 1), (52, 'C99015', 12, 3), (53, 'C99015', 15, 1), (54, 'C99015', 19, 2),

-- User C99016 (2 products)
(55, 'C99016', 22, 1), (56, 'C99016', 27, 4),

-- User C99017 (1 product)
(57, 'C99017', 30, 2),

-- User C99018 (3 products)
(58, 'C99018', 33, 1), (59, 'C99018', 36, 3), (60, 'C99018', 40, 1),

-- User C99019 (7 products)
(61, 'C99019', 44, 2), (62, 'C99019', 48, 3), (63, 'C99019', 2, 1), (64, 'C99019', 6, 2), (65, 'C99019', 10, 1), (66, 'C99019', 14, 4), (67, 'C99019', 18, 1),

-- User C99020 (5 products)
(68, 'C99020', 23, 3), (69, 'C99020', 28, 2), (70, 'C99020', 32, 1), (71, 'C99020', 37, 3), (72, 'C99020', 41, 2);


INSERT INTO delivery_info (id, name, mobile_no) VALUES
(1, 'Arun Kumar', 9876543210),
(2, 'Balaji Rao', 9876543211),
(3, 'Chandran M', 9876543212),
(4, 'Dinesh R', 9876543213),
(5, 'Ezhil S', 9876543214),
(6, 'Farhan A', 9876543215),
(7, 'Ganesh K', 9876543216),
(8, 'Hari Prasad', 9876543217),
(9, 'Ilayaraja B', 9876543218),
(10, 'Jagan K', 9876543219),
(11, 'Karthik M', 9876543220),
(12, 'Lakshmanan P', 9876543221),
(13, 'Mohan S', 9876543222),
(14, 'Naveen Kumar', 9876543223),
(15, 'Om Prakash', 9876543224),
(16, 'Prakash J', 9876543225),
(17, 'Quadir S', 9876543226),
(18, 'Rajesh T', 9876543227),
(19, 'Sandeep K', 9876543228),
(20, 'Thirumal V', 9876543229),
(21, 'Udhay Kumar', 9876543230),
(22, 'Venkatesh B', 9876543231),
(23, 'Waseem R', 9876543232),
(24, 'Xavier T', 9876543233),
(25, 'Yogesh P', 9876543234),
(26, 'Zubair A', 9876543235),
(27, 'Ajith R', 9876543236),
(28, 'Bharath K', 9876543237),
(29, 'Charan S', 9876543238),
(30, 'Deepak T', 9876543239)


INSERT INTO shipping (id, order_id, status, delivery_person_id) VALUES
(1, 47, 'processing', 5),
(2, 12, 'shipped', 12),
(3, 35, 'out for delivery', 22),
(4, 2, 'delivered', 7),
(5, 28, 'processing', 18),
(6, 9, 'shipped', 9),
(7, 50, 'out for delivery', 10),
(8, 21, 'delivered', 15),
(9, 3, 'cancelled', 11),
(10, 45, 'processing', 28),
(11, 18, 'shipped', 3),
(12, 41, 'out for delivery', 19),
(13, 8, 'delivered', 11),
(14, 30, 'processing', 24),
(15, 22, 'shipped', 12),
(16, 14, 'out for delivery', 25),
(17, 43, 'delivered', 8),
(18, 6, 'cancelled', 20),
(19, 39, 'processing', 2),
(20, 10, 'shipped', 14),
(21, 32, 'out for delivery', 21),
(22, 16, 'delivered', 13),
(23, 29, 'processing', 10),
(24, 5, 'shipped', 16),
(25, 48, 'out for delivery', 30),
(26, 13, 'delivered', 26),
(27, 37, 'cancelled', 27),
(28, 1, 'processing', 6),
(29, 26, 'shipped', 17),
(30, 42, 'out for delivery', 13),
(31, 11, 'delivered', 21),
(32, 23, 'processing', 26),
(33, 31, 'shipped', 29),
(34, 4, 'out for delivery', 20),
(35, 46, 'delivered', 19),
(36, 15, 'cancelled', 17),
(37, 20, 'processing', 30),
(38, 36, 'shipped', 30),
(39, 19, 'out for delivery', 23),
(40, 34, 'delivered', 4),
(41, 9, 'processing', 12),
(42, 38, 'shipped', 22),
(43, 7, 'out for delivery', 18),
(44, 49, 'delivered', 1),
(45, 17, 'cancelled', 28),
(46, 24, 'processing', 26),
(47, 44, 'shipped', 9),
(48, 33, 'out for delivery', 29),
(49, 25, 'delivered', 27),
(50, 40, 'processing', 3);


--filter by highorder user list
SELECT u.id as user_id, u.name as user_name, COUNT(o.id) AS total_orders
FROM users u
JOIN order_details o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_orders asc
LIMIT 10;
-- Total Revenue Per User
SELECT od.user_id, SUM(od.total_amount) AS total_revenue
FROM order_details od
GROUP BY od.user_id order by total_revenue desc;
--Total Sales Per Product
SELECT oi.product_id, SUM(oi.quantity) AS total_sold
FROM order_items oi
GROUP BY oi.product_id;
--Revenue Generated Per Product
SELECT oi.product_id, SUM(oi.price * oi.quantity) AS total_revenue
FROM order_items oi
GROUP BY oi.product_id;
--Category-Wise Product Count
SELECT c.category_name, COUNT(pc.product_id) AS total_products
FROM categories c
JOIN product_categories pc ON c.id = pc.category_id
GROUP BY c.category_name;
--Stock Available Per Product
SELECT pd.name, sd.stock_quantity
FROM product_details pd
JOIN stock_details sd ON pd.id = sd.product_id
GROUP BY pd.name, sd.stock_quantity;
--Most Ordered Product
SELECT oi.product_id, pd.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN product_details pd ON oi.product_id = pd.id
GROUP BY oi.product_id, pd.name
ORDER BY total_sold DESC
LIMIT 1;
--Total Orders Per Payment Method
SELECT payment_method, COUNT(id) AS total_orders
FROM payment_details
GROUP BY payment_method;
--Revenue Per Payment Method
SELECT p.payment_method, SUM(o.total_amount) AS total_revenue
FROM payment_details p
JOIN order_details o ON p.order_id = o.id
GROUP BY p.payment_method;
--Total Revenue Per Category
SELECT c.category_name, SUM(oi.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN product_categories pc ON oi.product_id = pc.product_id
JOIN categories c ON pc.category_id = c.id
GROUP BY c.category_name;
--Number of Products in Each User's Cart
SELECT user_id, COUNT(id) AS total_products
FROM cart_details
GROUP BY user_id;
--Orders Per Shipping Status
SELECT s.status, COUNT(s.id) AS total_orders
FROM shipping s
GROUP BY s.status;
--Average Order Amount Per User
SELECT user_id, AVG(total_amount) AS avg_order_amount
FROM order_details
GROUP BY user_id;
--Total Revenue Per Delivery Person
SELECT di.name, SUM(o.total_amount) AS total_revenue
FROM shipping s
JOIN order_details o ON s.order_id = o.id
JOIN delivery_info di ON s.delivery_person_id = di.id
GROUP BY di.name;
--Orders Shipped by Each Delivery Person
SELECT di.name, COUNT(s.id) AS total_orders
FROM shipping s
JOIN delivery_info di ON s.delivery_person_id = di.id
GROUP BY di.name;

--Total Quantity Sold Per Category
SELECT c.category_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN product_categories pc ON oi.product_id = pc.product_id
JOIN categories c ON pc.category_id = c.id
GROUP BY c.category_name;

--filter by categories
SELECT p.id, p.name, p.description, p.price 
FROM product_details p
JOIN product_categories pc ON p.id = pc.product_id
JOIN categories c ON pc.category_id = c.id
WHERE c.category_name = 'Sports & Fitness';
--filter by individual product 
SELECT u.id, u.name, u.e_mail, u.address 
FROM users u
JOIN order_details o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN product_details p ON oi.product_id = p.id
WHERE p.name = 'iPhone 15';
-- filter by high_delivery person
SELECT d.id AS delivery_person_id, d.name, COUNT(s.id) AS total_deliveries  
FROM shipping s  
JOIN delivery_info d ON s.delivery_person_id = d.id  
WHERE s.status = 'delivered'  
GROUP BY d.id, d.name  
ORDER BY total_deliveries asc
limit 1;
--filter by successful transaction 
SELECT u.id AS user_id, u.name, p.id AS payment_id, p.transaction_id  
FROM users u  
JOIN order_details o ON u.id = o.user_id  
JOIN payment_details p ON o.id = p.order_id  
WHERE p.status = 'completed' ;  
--filter by order pending 
SELECT u.id AS user_id, u.name, o.id AS order_id, o.status  
FROM users u  
JOIN order_details o ON u.id = o.user_id  
WHERE o.status = 'pending';
--filter by payment_method and order_status
SELECT p.order_id, p.status AS payment_status, o.status AS order_status  
FROM payment_details p  
JOIN order_details o ON p.order_id = o.id  
WHERE p.payment_method = 'PayPal';

