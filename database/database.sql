-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2023 at 10:20 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selfcaredb`
--
CREATE DATABASE IF NOT EXISTS `selfcaredb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `selfcaredb`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `picture_url` text DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `picture_url`, `created_on`, `updated_on`, `updated_by`) VALUES
(5, 'Parfume', 'Aroma dhe parfume te zgjedhura', 'https://hips.hearstapps.com/harpersbazaaruk.cdnds.net/16/50/4000x2000/landscape-1481713221-winter-fragrances.jpg', '2023-02-26 16:36:23', NULL, 4),
(6, 'Kujdes per lekure', 'Produkte per pastrimin dhe mirembajtjen e lekures', 'https://bluewaterdayspanapa.com/wp-content/uploads/2022/04/394bcea3-e2ac-4d96-b8cd-df695e396628.jpg', '2023-02-26 16:38:50', NULL, 4),
(7, 'Grim', 'Produkte te shumta duke filluar nga fondatinat, maskarat, buzekuqet me te perzgjedhur', 'https://media.allure.com/photos/63ed49438aefbb64740b797c/16:9/w_3488,h_1962,c_limit/2-15-body-make-up.jpg', '2023-02-26 16:40:11', NULL, 4),
(8, 'Kujdes per floket', 'Produkte duke filluar nga kujdesi deri te zbukurimi i flokeve', 'https://media.istockphoto.com/id/1218131909/photo/female-hair-hair-mask-and-bamboo-comb-on-white-background-top-view-flat-lay-copy-space-self.jpg?s=612x612&w=0&k=20&c=0C7SPmIgMhDB8eyq1heb7qHEypoOzhUwVW8ovMfCE0E=', '2023-02-26 16:41:42', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category_product_mapping`
--

CREATE TABLE `category_product_mapping` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_product_mapping`
--

INSERT INTO `category_product_mapping` (`id`, `category_id`, `product_id`) VALUES
(11, 5, 13),
(12, 5, 14),
(13, 5, 15),
(14, 5, 16),
(15, 6, 17),
(16, 6, 18),
(17, 6, 19),
(18, 6, 20),
(19, 7, 21),
(20, 7, 22),
(21, 7, 23),
(22, 7, 24),
(23, 8, 25),
(24, 8, 26),
(25, 8, 27),
(26, 8, 28);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `surname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `hashed_password` varchar(1000) NOT NULL,
  `user_role` enum('regular','admin') DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `phone_number` varchar(256) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `surname`, `email`, `hashed_password`, `user_role`, `created_on`, `updated_on`, `updated_by`, `phone_number`, `birthdate`, `gender`) VALUES
(4, 'Erleta', 'Nasufi', 'erleta.nasufi@gmail.com', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'admin', '2023-02-26 16:34:29', NULL, NULL, '+38344123456', '2000-03-19 00:00:00', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(12, 7, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `picture_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `stock`, `is_active`, `created_on`, `updated_on`, `updated_by`, `picture_url`) VALUES
(13, 'Eau de Toilette Armaf Club De Nuit Intense Man, 105ml', 'N?? m??nyr?? q?? meshkujt t?? ndjehen t?? freks??t marka Armaf ka dizajnuar arom??n Club De Nuit Intense e cila ??sht?? punuar nga limoni, rrushi pa fara, molla, bergamoti, ananasi, tr??ndafili, jasemini, thupra, vanilja, qelibari i hirt??, myshku dhe patchouli. Fal?? k??saj p??rb??rje kjo arom?? ??sht?? afatgjate dhe e parezistueshme.', 43, 10, 1, '2023-02-26 16:48:31', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1448/1448105.jpg?width=600&height=600'),
(14, 'Eau De Parfum Hugo Boss Femme 30 ml', 'Njihet gjithashtu si ???Extrait de Parfum??? (q?? i referohet Parfumit t?? v??rtet??), ky lloj p??rmban n?? vete koncentrim m?? t?? madh t?? ekstraktit (rreth 15% deri n?? 40% arom??) dhe q?? zgjat prej 6 deri n?? 8 or??. N?? p??rgjith??si, p??r shkak t?? koncentrimit m?? t?? madh t?? arom??s, ato kan?? edhe ??mimin m?? t?? lart?? se sa llojet e parfumave t?? tjer??.', 28, 15, 1, '2023-02-26 16:49:06', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/0702/0702586.jpg?width=600&height=600'),
(15, 'Eau De Toilette Hugo Boss Orange Woman - 30 ml', ' Njihet gjithashtu si ???Extrait de Parfum??? (q?? i referohet Parfumit t?? v??rtet??), ky lloj p??rmban n?? vete koncentrim m?? t?? madh t?? ekstraktit (rreth 15% deri n?? 40% arom??) dhe q?? zgjat prej 6 deri n?? 8 or??. N?? p??rgjith??si, p??r shkak t?? koncentrimit m?? t?? madh t?? arom??s, ato kan?? edhe ??mimin m?? t?? lart?? se sa llojet e parfumave t?? tjer??.', 24, 9, 1, '2023-02-26 16:49:34', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1738/1738945.jpg?width=600&height=600'),
(16, 'Parfum Gucci Bamboo, 30 ml', '??sht?? nj?? nd??r llojet m?? t?? k??rkuara. Ky lloj ka koncentrim t?? ekstraktit prej 5% deri n?? 15% dhe zgjat 2-3 or??. Konsiderohen si m?? t?? leht??/but??, p??r k??t?? arsye p??rdoren m?? shum?? dit??n krahasuar me ???Parfumat??? q?? p??rdoren m?? shum?? nat??n.', 36, 22, 1, '2023-02-26 16:49:58', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1301/1301935.jpg?width=600&height=600'),
(17, 'Pastrues p??r l??kur?? t?? yndyrshme CeraVe, 236 ml', 'CeraVe Foaming Cleanser 236ml i zhvilluar nga dermatolog??t, ??sht?? nj?? pastrues me shkum?? q?? pastron dhe largon sebumin e tep??rt (fytyr?? dhe trup) pa ndryshuar barrier??n mbrojt??se t?? l??kur??s. Ideale p??r l??kur??n normale deri t?? yndyrshme, kjo formul?? p??rmban 3 ceramide thelb??sore q?? l??kura e sh??ndetshme ka nevoj?? p??r t?? ndihmuar n?? rinovimin dhe ruajtjen e barrier??s s?? saj mbrojt??se natyrore, dhe acidin hialuronik.', 15, 22, 1, '2023-02-26 16:55:52', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1453/1453739.jpg'),
(18, 'Krem hidratues CeraVe, 340 gr', 'Krem hidratues CeraVe ndihmon n?? hidratimin dhe l??kur??n q?? ndihet e that?? dhe e pak??ndshme. Struktura jo-yndyrore p??rmban tre Ceramide thelb??sore dhe Acid Hialuronik q?? punojn?? n?? sinergji ndaj lag??shtir??s dhe mbrojn?? penges??n natyrore t?? l??kur??s. Formuluar posa????risht p??r t?? hidratuar l??kur??n e ndjeshme q?? ??sht?? e that??. Gjithashtu i p??rshtatsh??m p??r t\'u p??rdorur n?? l??kur?? me prirje p??r ekzem??. Hidraton barrier??n mbrojt??se t?? l??kur??s t?? fytyr??s dhe trupit.', 26, 11, 1, '2023-02-26 16:56:25', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/2091/2091987.jpg'),
(19, 'Xhel La Roche Posay Cicaplast, 40ml', 'Kujdesi p??r rikuperim t?? l??kur??s pas p??rdorimit t?? laserit, pas tretmaneve kozmetike dhe pas heqjes s?? qepjes s?? plag??s. P??r f??mij?? dhe t?? rritur. CICAPLAST GEL B5 xheli p??rmban p??rb??r??s aktiv t?? kombinuar p??r t?? krijuar nj?? kujdes t?? lart?? p??r rikuperim t?? l??kur??s.', 15, 10, 1, '2023-02-26 16:56:56', NULL, 4, ' https://gv466hf5ah.gjirafa.net/image/1957/1957530.jpg'),
(20, 'Gel pastrues La Roche Posay', 'Keni probleme me l??kur?? t?? yndyrshme, pore t?? zgjeruara dhe akne? Ky gel pastrues ??sht?? i duhuri p??r pastrimin e fytyr??s suaj. Sh??ron l??kur??n dhe eliminon mbetjet yndyrore. P??rmir??son gjendjen e l??kur??s dhe i mund??son funksionimin e duhur. Nuk p??rmban detergjent, ngjyra artificiale, paraben apo alkool. Ka nivel t?? pH-se 5.5. Aplikojeni n?? fytyr?? dhe shkumojeni e masazhojeni, n?? fund shp??lajeni me uj??. P??rdoreni n?? m??ngjes dhe mbr??mje.', 17, 12, 1, '2023-02-26 16:57:26', NULL, 4, ' https://gv466hf5ah.gjirafa.net/image/0249/0249158.jpg'),
(21, 'Hije p??r sy Maybelline Total Temptation 9.6 g', 'Maybelline sjell n?? treg hijen p??r sy me tekstur?? inovative dhe ngjyr?? intenzive e cila ??sht?? e p??rsosur p??r ??do lloj stili e ??do lloj ngjarje. Kjo hije vjen me 10 nuanca me shkelqim dhe pa. P??r shkak t?? p??rqendrimit t?? lart?? t?? ngjyr??s, hijet p??rdoren n?? nj?? l??vizje dhe menj??her?? theksojn?? shprehjen e syve. Fal?? p??rmbajtjes s?? shtuar t?? pigmenteve t?? ngjyrave, hijet duken edhe m?? t?? shk??lqyera.', 7, 24, 1, '2023-02-26 17:03:36', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1034/1034740.jpg'),
(22, 'Set brusha kozmetike Real Techniques Artist Essentials', ' Set brusha kozmetike p??r grim perfekt t?? fytyr??s, syve dhe buz??ve. Seti p??rmban: brush?? p??r hijen e syve, brush?? grimi, brush?? p??r aplikimin e pudr??s ndri??uese, brush?? p??r aplikimin e buz??kuqit dhe brush?? p??r aplikimin e pudrave. Brushat jan?? t?? punuara nga fijet sintetike dhe jan?? t?? p??rshtatshme p??r grimin e p??rditsh??m.', 31, 15, 1, '2023-02-26 17:04:02', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/0828/0828942.jpg'),
(23, 'Krem pud??r Double Wear SPF 10 Est??e Lauder Nr. 4N1 Shell Beige 30 ml', ' B??ni grimin tuaj n?? m??ngjes dhe largoni shqet??simin p??r m??nyr??n se si fytyra juaj duket gjat?? gjith?? dit??s me k??t?? krem pud??r. Pas 15 or??sh l??kura juaj do t?? jet?? ende e fresk??t dhe e natyrshme, edhe n??se q??ndroni n?? nj?? klim?? t?? ngroht?? dhe t?? lag??sht. P??rb??rja pa vaj dhe parfum, siguron mbrojtje t?? leht?? UV. Produkti ??sht?? i p??rshtatsh??m p??r t?? gjitha llojet e l??kur??s. Testuar dermatologjikisht.', 39, 14, 1, '2023-02-26 17:04:32', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/0606/0606693.jpg'),
(24, 'Buz??kuq i l??ngsh??m NYX Soft Matte, Cannes, 8ml', ' N?? ngjyrat mat q?? b??jn?? deklarata, nuancat tona me baz?? nude t?? kremit Soft Matte Lip krijojn?? nj?? shp??rthim t?? ngjyr??s kremoze q?? jep nj?? fund mahnit??s mat. E q??ndrueshme, e leht?? dhe kremoze e k??ndshme, nuk ??sht?? ??udi q?? kjo formul?? me arom?? t?? k??ndshme ??sht?? e preferuara e adhuruesve t?? Makeup Professional NYX.', 5, 35, 1, '2023-02-26 17:04:56', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1290/1290167.jpg'),
(25, 'Trajtuesp??r flok?? Olaplex Hair Perfector N?? 3, 100 ml', '??sht?? nj?? trajtues intensiv q?? forcon dhe riparon flok??t e d??mtuar dhe t?? dob??suar, duke i mbrojtur ata nga d??mtimet e ardhshme t?? shkaktuara nga zbardhja ose ngjyrosja. Produkti ??sht?? ideal p??r t?? gjitha llojet e flok??ve, ve??an??risht ato t?? dob??suara, t?? thata dhe t?? d??mtuara nga trajtimet kimike.', 30, 9, 1, '2023-02-26 17:59:27', '2023-02-26 18:01:43', 4, 'https://gv466hf5ah.gjirafa.net/image/1809/1809335.jpg'),
(26, 'Thar??se p??r flok?? Revlon One step Volumiser RVDR5222, 800 W', 'Fur??a Revlon Salon One-Step ??sht?? nj?? teknologji komplekse q?? e b??n pajisjen nj?? thar??se flok??sh t?? nivelit t?? lart??. Fal?? tij, flok??t b??hen m?? t?? bukur dhe m?? t?? zbutur dhe i gjith?? frizuari fiton karakter. Produkti i krijuar p??r p??rdoruesit m?? k??rkues do t\'ju ndihmoj?? t?? b??heni zot n?? vet??m pak minuta. Ju nuk keni nevoj?? p??r stilist?? p??r k??t??. ', 98, 5, 1, '2023-02-26 17:59:52', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/2074/2074672.jpg'),
(27, 'Stilues p??r flok?? BaByliss PRO BAB2269TTE', 'Stiluesi ka sip??rfaqe titaniumi dhe turmaline, e cila e mund??son ngrohjen e saj t?? shpejt dhe t?? nj??tratshme. Me funksion t?? trefisht?? ajo ??sht?? ideale p??r krijimin n?? p??rsosm??ri t?? dredhave t?? ngjajshme me vitet e 50-ta. Ajo ka rezistenc?? t?? lart??, kontrollim t?? temperatur??s n?? mes t?? 140 deri n?? 220 grad??, nd??rprer??s p??r ky??je/??ky??je dhe kabllo 2.7 m. V??rejtje: lexoni mir?? udh??zimet para p??rdorimit.', 67, 5, 1, '2023-02-26 18:00:24', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/0358/0358239.jpg'),
(28, 'Shampo p??r flok?? OGX Brazilian Keratin, 385ml', 'Shampo brazilian me vaj kokosi, proteina keratine, vaj avokado dhe gjalp?? kakao. Fal?? k??saj p??rb??rjeje t?? pasur, produkti ndihmon n?? forcimin dhe zbutjen e flok??ve dhe n?? t?? nj??jt??n koh?? shton nj?? shk??lqim rrezatues.', 7, 15, 1, '2023-02-26 18:00:48', NULL, 4, 'https://gv466hf5ah.gjirafa.net/image/1323/1323871.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`id`, `customer_id`, `total_price`, `is_paid`, `delivery_address`, `created_on`, `updated_on`, `updated_by`) VALUES
(7, 4, 30, 0, 'Rr. Edith Durhan', '2023-02-26 18:01:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `customer_id`, `product_id`, `created_on`) VALUES
(9, 4, 23, '2023-02-26 18:01:21'),
(10, 4, 22, '2023-02-26 18:01:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product_mapping`
--
ALTER TABLE `category_product_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_product_mapping`
--
ALTER TABLE `category_product_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_product_mapping`
--
ALTER TABLE `category_product_mapping`
  ADD CONSTRAINT `category_product_mapping_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_product_mapping_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `user_orders` (`id`),
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `user_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
