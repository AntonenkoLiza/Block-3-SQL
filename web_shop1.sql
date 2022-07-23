
CREATE DATABASE IF NOT EXISTS `web_shop1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `web_shop1`;

CREATE TABLE `images` (
  `Id` int(11) NOT NULL,
  `URL_address` varchar(4121) NOT NULL,
  `ALT_att` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `images` (`Id`, `URL_address`, `ALT_att`) VALUES
(1, 'C:/Users/s-shc/Desktop/Блок 2/Карточка товара Lamoda/image/2.jpg', 'Рубашка Medicine рис. 1'),
(2, 'C:/Users/s-shc/Desktop/Блок 2/Карточка товара Lamoda/image/4.jpg', 'Рубашка Medicine рис. 2'),
(3, 'C:/Users/s-shc/Desktop/Блок 2/Карточка товара Lamoda/image/6.jpg', 'Рубашка Medicine рис. 3');

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` varchar(4121) DEFAULT NULL,
  `activity` tinyint(1) DEFAULT NULL,
  `price` decimal(15,2) UNSIGNED DEFAULT NULL,
  `price_no_discount` decimal(15,2) UNSIGNED NOT NULL,
  `price_promo` decimal(15,2) UNSIGNED DEFAULT NULL,
  `id_section` int(11) NOT NULL,
  `id_image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` (`id`, `name`, `description`, `activity`, `price`, `price_no_discount`, `price_promo`, `id_section`, `id_image`) VALUES
(1, 'Рубашка Medicine', 'Рубашка Medicine выполнена из вискозной ткани с клетчатым узором.', 1, '2499.00', '2699.00', '2227.00', 2, 1),
(2, 'Юбка женская Medicine', 'Юбка Medicine выполнена из вискозной ткани с клетчатым узором.', 1, '1999.00', '2150.00', '1899.00', 1, 2);

CREATE TABLE `products_section` (
  `id_section` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products_section` (`id_section`, `id_product`) VALUES
(2, 2),
(2, 1),
(1, 1),
(1, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 2),
(2, 2),
(2, 2),
(2, 2),
(2, 1),
(2, 2),
(2, 2);


CREATE TABLE `product_images` (
  `id_product` int(11) DEFAULT NULL,
  `id_image` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product_images` (`id_product`, `id_image`) VALUES
(1, 1),
(1, 2),
(1, 3);
CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(4121) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sections` (`id`, `name`, `description`) VALUES
(1, 'Юбки женские', 'Красивые женские юбки только у нас!'),
(2, 'Рубашки', 'Рубашки на любую фигуру приходите и покупаете именно наши рубашки!');
ALTER TABLE `images`
  ADD PRIMARY KEY (`Id`);
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_sections_fk` (`id_section`),
  ADD KEY `products_images_fk` (`id_image`);
ALTER TABLE `products_section`
  ADD KEY `products_section_sections_fk` (`id_section`),
  ADD KEY `products_section_products_fk` (`id_product`);
ALTER TABLE `product_images`
  ADD KEY `product_images_products_fk` (`id_product`),
  ADD KEY `product_images_images_fk` (`id_image`);
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `products`
  ADD CONSTRAINT `products_images_fk` FOREIGN KEY (`id_image`) REFERENCES `images` (`Id`),
  ADD CONSTRAINT `products_sections_fk` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id`);

ALTER TABLE `products_section`
  ADD CONSTRAINT `products_section_products_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_section_sections_fk` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id`);
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_images_fk` FOREIGN KEY (`id_image`) REFERENCES `images` (`Id`),
  ADD CONSTRAINT `product_images_products_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;
