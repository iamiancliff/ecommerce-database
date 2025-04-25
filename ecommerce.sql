-- Create the database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Product Category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Product Image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_value VARCHAR(7)
);

-- Size Category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Size Option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_label VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Product Variation table (size, color)
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Product Item table (purchasable item with variation)
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    quantity_in_stock INT DEFAULT 0,
    price DECIMAL(10,2),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Attribute Category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Attribute Type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL -- e.g. text, number, boolean
);

-- Product Attribute table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Sample Data Insertion
INSERT INTO color (color_name) VALUES 
    ('Red'), 
    ('Blue'), 
    ('Black'), 
    ('White'), 
    ('Green'), 
    ('Brown'), 
    ('Silver'), 
    ('Gold'), 
    ('Beige');

INSERT INTO product_category (category_name, parent_category_id) VALUES 
    ('Clothing', NULL), 
    ('Electronics', NULL), 
    ('Men’s Wear', 1), 
    ('Automotive', NULL), 
    ('Furniture', NULL), 
    ('Home Furniture', 5), 
    ('Smartphones', 2), 
    ('Personal Care', NULL), 
    ('Beverages', NULL), 
    ('Home Electronics', 2);

INSERT INTO brand (brand_name) VALUES 
    ('Mara Moja'), 
    ('Safaricom'), 
    ('Isuzu Kenya'), 
    ('Victoria Furniture'), 
    ('Kipepeo Designs'), 
    ('Airtel Kenya'), 
    ('Unilever Kenya'), 
    ('East African Breweries'), 
    ('LG Kenya');

INSERT INTO size_category (category_name) VALUES 
    ('Clothing Sizes'), 
    ('Shoe Sizes'), 
    ('Furniture Dimensions'), 
    ('TV Screen Sizes');

INSERT INTO size_option (size_category_id, size_name) VALUES 
    (1, 'S'), 
    (1, 'M'), 
    (2, '42'), 
    (1, 'L'), 
    (3, '3-Seater'), 
    (3, '5-Seater'), 
    (4, '32-Inch'), 
    (4, '43-Inch'), 
    (1, 'XL');

INSERT INTO attribute_category (category_name) VALUES 
    ('Physical'), 
    ('Technical'), 
    ('Automotive'), 
    ('Beverage');

INSERT INTO attribute_type (attribute_category_id, type_name, data_type) VALUES 
    (1, 'Material', 'Text'), 
    (1, 'Weight', 'Number'), 
    (2, 'Storage', 'Text'), 
    (3, 'Fuel Type', 'Text'), 
    (1, 'Upholstery', 'Text'), 
    (2, 'Screen Resolution', 'Text'), 
    (1, 'Scent', 'Text'), 
    (4, 'Alcohol Content', 'Number');

INSERT INTO product (category_id, brand_id, product_name, description, base_price) VALUES 
    (3, 1, 'Men’s T-Shirt', 'Comfortable cotton t-shirt', 1500.00),
    (7, 2, 'Smartphone', 'Safaricom Neon smartphone', 10000.00),
    (4, 3, 'Pickup Truck', 'Isuzu D-Max double cab', 4500000.00),
    (6, 4, 'Sofa Set', 'Modern 5-seater sofa', 75000.00),
    (3, 5, 'Women’s Dress', 'Kipepeo Designs Ankara dress', 3500.00),
    (7, 6, 'Budget Smartphone', 'Airtel 4G smartphone', 8000.00),
    (8, 7, 'Bar Soap', 'Lifebuoy antibacterial soap', 100.00),
    (9, 8, 'Beer', 'Tusker Lager', 150.00),
    (10, 9, 'LED TV', 'LG Smart LED TV', 35000.00);

INSERT INTO product_item (product_id, sku, stock_quantity, price) VALUES 
    (1, 'TSHIRT-RED-M', 50, 1600.00),
    (1, 'TSHIRT-BLUE-S', 30, 1550.00),
    (2, 'PHONE-BLACK-64', 20, 10500.00),
    (3, 'PICKUP-WHITE-DIESEL', 5, 4600000.00),
    (4, 'SOFA-BROWN-5SEAT', 10, 78000.00),
    (5, 'DRESS-GREEN-L', 25, 3600.00),
    (2, 'PHONE-WHITE-128', 15, 12000.00),
    (6, 'PHONE-SILVER-32', 40, 8200.00),
    (7, 'SOAP-BEIGE-125G', 100, 110.00),
    (8, 'BEER-GOLD-500ML', 200, 160.00),
    (9, 'TV-BLACK-43INCH', 8, 38000.00);

INSERT INTO product_variation (item_id, color_id, size_option_id) VALUES 
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, NULL),
    (4, 4, NULL),
    (5, 6, 6),
    (6, 5, 4),
    (7, 4, NULL),
    (8, 7, NULL),
    (9, 9, NULL),
    (10, 8, NULL),
    (11, 3, 8);

INSERT INTO product_image (product_item_id, image_url) VALUES 
    (1, '/images/tshirt-red-m.jpg'),
    (2, '/images/tshirt-blue-s.jpg'),
    (3, '/images/phone-black.jpg'),
    (4, '/images/pickup-white.jpg'),
    (5, '/images/sofa-brown-5seat.jpg'),
    (6, '/images/dress-green-l.jpg'),
    (7, '/images/phone-white.jpg'),
    (8, '/images/phone-silver.jpg'),
    (9, '/images/soap-beige.jpg'),
    (10, '/images/beer-gold.jpg'),
    (11, '/images/tv-black-43inch.jpg');

INSERT INTO product_attribute (product_id, attribute_type_id, attribute_value) VALUES 
    (1, 1, 'Cotton'),
    (1, 2, '200'),
    (2, 3, '64GB'),
    (3, 4, 'Diesel'),
    (4, 5, 'Leather'),
    (4, 2, '25000'),
    (5, 1, 'Ankara Fabric'),
    (2, 3, '128GB'),
    (6, 3, '32GB'),
    (7, 7, 'Herbal'),
    (7, 2, '125'),
    (8, 8, '4.5'),
    (9, 6, '4K UHD');