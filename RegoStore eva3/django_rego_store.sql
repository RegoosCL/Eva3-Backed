-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2024 a las 04:09:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `django_rego_store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(3, 'pbkdf2_sha256$260000$Yzs8cJT8KQkRbAOhsl3VSZ$FFBgeStUsLfsPCnYyncamCJpHAOnxshKPOK+jUsoI4c=', '2024-10-26 01:51:00.252229', 1, 'regoadmin', '', '', 'rego@gmail.com', 1, 1, '2024-10-25 01:14:19.408586'),
(4, 'pbkdf2_sha256$260000$X9cUpHwdSRGLJEATefIlXk$klzoDhBvvudLgiGhKJGJrRHvgJsxKFu96GM9UcKqLq8=', '2024-10-26 02:04:40.803576', 0, 'RegoosCL', '', '', 'regoocl@gmail.com', 0, 1, '2024-10-26 02:04:31.276161');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-25 01:26:18.590603', '7', 'Pantalón Bape Shark Verde', 1, '[{\"added\": {}}]', 7, 3),
(2, '2024-10-25 01:42:58.468884', '8', 'Sudadera Kenzo Dorada', 1, '[{\"added\": {}}]', 7, 3),
(3, '2024-10-25 02:17:12.891177', '9', 'Sudadera Off White', 1, '[{\"added\": {}}]', 7, 3),
(4, '2024-10-25 22:55:48.539636', '10', 'Chandal Trapstar Shooter', 1, '[{\"added\": {}}]', 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'regoapp', 'contact'),
(7, 'regoapp', 'product'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-24 00:38:39.396029'),
(2, 'auth', '0001_initial', '2024-10-24 00:38:39.902350'),
(3, 'admin', '0001_initial', '2024-10-24 00:38:40.005005'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-24 00:38:40.013959'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-24 00:38:40.021869'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-24 00:38:40.076971'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-24 00:38:40.122579'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-24 00:38:40.141427'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-24 00:38:40.160270'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-24 00:38:40.198463'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-24 00:38:40.203444'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-24 00:38:40.212350'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-24 00:38:40.224253'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-24 00:38:40.236211'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-24 00:38:40.250594'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-24 00:38:40.259025'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-24 00:38:40.271425'),
(18, 'sessions', '0001_initial', '2024-10-24 00:38:40.296411'),
(19, 'regoapp', '0001_initial', '2024-10-24 22:06:41.330952'),
(20, 'regoapp', '0002_auto_20241024_1913', '2024-10-24 22:13:08.039516');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('a574bh8pogvj6bmh8rszef3jp52encn3', '.eJxVjDsOwyAQRO9CHSFI-K3L9DkDAhaCkwhLgCvLdw-WXCTNFDNv3kasW3u2a4vVzkgmIsjlt_MuvGM5Bny58lxoWEqvs6cHQs-10ceC8XM_2T9Bdi2PtwKfGBupQHDgkoNBhUFfpXBBMu1VAo7mxoAprXWK0SDjwSeNIBXGIQ2udjJt-_4F-BA6tw:1t4WAr:XrozozxvFAZoPX91Yx__vEIy8BR9iUL1OElm6Dc_NrM', '2024-11-09 02:05:05.472186');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regoapp_carrito`
--

CREATE TABLE `regoapp_carrito` (
  `id` int(11) NOT NULL,
  `producto_id` varchar(255) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio` float(100,0) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `total` float(100,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regoapp_carrito`
--

INSERT INTO `regoapp_carrito` (`id`, `producto_id`, `nombre_producto`, `precio`, `cantidad`, `total`) VALUES
(7, '10', 'Chandal Trapstar Shooter', 19999, 1, 19999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regoapp_contact`
--

CREATE TABLE `regoapp_contact` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mensaje` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regoapp_contact`
--

INSERT INTO `regoapp_contact` (`id`, `nombre`, `email`, `mensaje`) VALUES
(3, 'RegoosCL', 'rego@gmail.com', 'hola, tengo una keja xd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regoapp_product`
--

CREATE TABLE `regoapp_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regoapp_product`
--

INSERT INTO `regoapp_product` (`id`, `name`, `price`, `discounted_price`, `image_url`) VALUES
(1, 'Chandal Palm Angels Azul Cielo', 29990.00, 39990.00, 'https://dripbcn.com/wp-content/uploads/2023/10/Proyecto-nuevo-3.png'),
(2, 'Camiseta Moncler Blanca', 29990.00, 39990.00, 'https://dripbcn.com/wp-content/uploads/2023/06/34dc2dad-PhotoRoom.png'),
(3, 'Chaleco Trapstar', 29990.00, 39990.00, 'https://dripbcn.com/wp-content/uploads/2023/10/0ec28aab-PhotoRoom.jpg'),
(4, 'Camiseta Burberry Negra', 29990.00, 39990.00, 'https://dripbcn.com/wp-content/uploads/2024/04/2ddd08e8-Photoroom.png'),
(5, 'Chandal Nike Tech Gris', 29990.00, 39990.00, 'https://dripbcn.com/wp-content/uploads/2024/01/b74d7931-PhotoRoom.png'),
(6, 'Chaqueta Trapstar', 29990.00, 39990.00, 'https://dripbcn.com/wp-content/uploads/2024/10/0f181cd8-Photoroom.png'),
(7, 'Pantalón Bape Shark Verde', 39999.00, 49999.00, 'https://dripbcn.com/wp-content/uploads/2024/05/d6110cb5-Photoroom.png'),
(8, 'Sudadera Kenzo Dorada', 29999.00, 39999.00, 'https://dripbcn.com/wp-content/uploads/2023/09/5909c8d5-removebg-preview.png'),
(9, 'Sudadera Off White', 29999.00, 39999.00, 'https://dripbcn.com/wp-content/uploads/2024/10/photo_2024-10-22_22-49-23-Photoroom.png'),
(10, 'Chandal Trapstar Shooter', 19999.00, 40000.00, 'https://dripbcn.com/wp-content/uploads/2023/10/ProyectoEERVREVF-nuevo.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `regoapp_carrito`
--
ALTER TABLE `regoapp_carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regoapp_contact`
--
ALTER TABLE `regoapp_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regoapp_product`
--
ALTER TABLE `regoapp_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `regoapp_carrito`
--
ALTER TABLE `regoapp_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `regoapp_contact`
--
ALTER TABLE `regoapp_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `regoapp_product`
--
ALTER TABLE `regoapp_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
