SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE cart (
  cart_id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  item_id int(11) NOT NULL,
  wishlisted BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (cart_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (item_id) REFERENCES product(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE product (
  item_id int(11) NOT NULL AUTO_INCREMENT,
  item_brand varchar(200) NOT NULL,
  item_name varchar(255) NOT NULL,
  item_price double(10,2) NOT NULL,
  item_image varchar(255) NOT NULL,
  PRIMARY KEY (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE user (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE wishlist (
  cart_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  item_id int(11) NOT NULL,
  PRIMARY KEY (cart_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (item_id) REFERENCES product(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE top_sales (
  item_id int(11) NOT NULL,
  sales_count int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (item_id),
  FOREIGN KEY (item_id) REFERENCES product(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE brand (
  brand_id int(11) NOT NULL AUTO_INCREMENT,
  brand_name varchar(200) NOT NULL,
  PRIMARY KEY (brand_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE cart ADD CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE cart ADD CONSTRAINT fk_cart_product FOREIGN KEY (item_id) REFERENCES product(item_id);
ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_user FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (item_id) REFERENCES product(item_id);
ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_cart FOREIGN KEY (cart_id) REFERENCES cart(cart_id);
ALTER TABLE top_sales ADD CONSTRAINT fk_top_sales_product FOREIGN KEY (item_id) REFERENCES product(item_id);

ALTER TABLE product MODIFY item_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
ALTER TABLE user MODIFY user_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE cart MODIFY cart_id int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO product (item_id, item_brand, item_name, item_price, item_image) VALUES
(1, 'Samsung', 'Samsung Galaxy 10', 80000.00, './assets/products/1.png'),
(2, 'Redmi', 'Redmi Note 7', 15000.00, './assets/products/2.png'),
(3, 'Redmi', 'Redmi Note 6', 14000.00, './assets/products/3.png'),
(4, 'Redmi', 'Redmi Note 5', 13000.00, './assets/products/4.png'),
(5, 'Redmi', 'Redmi Note 4', 12000.00, './assets/products/5.png'),
(6, 'Redmi', 'Redmi Note 8', 20000.00, './assets/products/6.png'),
(7, 'Redmi', 'Redmi Note 9', 30000.00, './assets/products/8.png'),
(8, 'Redmi', 'Redmi Note', 25000.00, './assets/products/10.png'),
(9, 'Samsung', 'Samsung Galaxy S6', 70000.00, './assets/products/11.png'),
(10, 'Samsung', 'Samsung Galaxy S7', 75000.00, './assets/products/12.png'),
(11, 'Apple', 'Apple iPhone 5', 20000.00, './assets/products/13.png'),
(12, 'Apple', 'Apple iPhone 6', 30000.00, './assets/products/14.png'),
(13, 'Apple', 'Apple iPhone 7', 40000.00, './assets/products/15.png');

INSERT INTO top_sales (item_id, sales_count) VALUES
(1, 100),
(2, 50),
(3, 75),
(6, 200);

INSERT INTO brand (brand_name) VALUES
('Samsung'),
('Redmi'),
('Apple');

INSERT INTO user (user_id, first_name, last_name) VALUES
(1, 'Anurag', 'Kasat'),
(2, 'Joy', 'Podder');